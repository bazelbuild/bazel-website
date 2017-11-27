---  
layout: contribute  
title: config parsing order  
---  
  
# Migration Help: --config parsing order  
  
**Design documents are not descriptions of the current functionality of Bazel.  
Always go to the documentation for current information.**  
  
**Status**: In Progress.  
  
**Author**: [Chloe Calvarin](mailto:ccalvarin@google.com)  
  
**Design document published**: 20 November 2017

## Background: bazerrc & --config 

[The Bazel User Manual](https://docs.bazel.build/versions/master/user-manual.html#bazelrc) contains the official documentation for bazelrcs and will not be repeated here.   
A Bazel build command line generally looks something like this:

    bazel <startup options> build <command options> //some/targets

For the rest of the doc, only the command options are relevant. Startup options can affect which bazelrc's are loaded, but that's the only effect they have here.

The bazelrcs allow users to set command options by default. These options can either be provided unconditionally or through a config expansion:

+  Unconditionally, they are defined for a command, and all commands that inherit from it,  
	`build --foo # applies "--foo" to build, test, etc`.
+  As a config expansions  
	`# applies "--foo" to build, test, etc. when --config=foobar is set.  
	build:foobar --foo `

## What is changing 

### The current order: fixed-point --config expansion

The current semantics of --config expansions breaks last-flag-wins expectations. In broad strokes, the current option order is

1. Unconditional rc options (options set by a command without a config, "`build --opt`")
1. All `--config` expansions are expanded in a "fixed-point" expansions.   
_This does not check where the `--config` option initially was (rc, command line, or another `--config`), and will parse a single `--config` value at most once. _
1. Command-line specified options

Bazel claims to have a last-flag-wins command line, and this is usually true, but the fixed-point expansion of configs makes it difficult to rely on ordering where `--config` options are concerned.   
See [example](#bookmark=id.griay5bfg5o2) below if you aren't convinced.

### The new order: Last-Flag-Wins

Everywhere else, the last mention of a single-valued option has "priority" and overrides a previous value. The same will now be true of --config expansion. Like other expansion options, --config will now expand to its rc-defined expansion "in-place."   
Since this is no longer a fixed-point expansion, there are a few other changes:

+  `--config=foo --config=foo` will be expanded twice. If this is undesirable, more care will need to be taken to avoid redundancy.
+  cycles are no longer implicitly ignored, but will error out.

Other rc ordering semantics remain. "common" options are expanded first, followed by the command hierarchy. This means that for an option added on the line "`build:foo --buildopt`", it will get added to `--config=foo`'s expansion for bazel build, test, coverage, etc. "`test:foo --testopt`" will add `--testopt` after the (less specific and therefore lower priority) build expansion of `--config=foo`. If this is confusing, avoid alternating command types in the rc file, and group them in order, general options at the top. This way, the order of the file is close to the interpretation order.

## How to start using new behavior 

1. Test your usual `--config` values' expansions by running your usual bazel command line with `--announce_rc`,
1. Spend some time understanding the applicable configs, and check if any configs expand to the same option. If they do, you may need to move rc lines around to make sure the same value has priority with the new ordering. 

    +  In general, include any recursive --config flags at the end of a config expansion, to minimize differences between the two orders.

1. Flip on the startup option `--expand_configs_in_place` and debug any differences using `--announce_rc   
`_If you have a shared bazelrc for your project, note that changing it will propagate to other users who might be importing this bazelrc into a personal rc. Proceed with caution as needed_
1. Add the following to your bazelrc to continue using this new expansion order:  
	startup `--expand_configs_in_place`

## Example

There are 2 boolean options, `--foo` and `--bar`. Each only accept one value (as opposed to accumulating multiple values).   
In the following examples, the two options --foo and --bar have the same apparent order (and will have the same behavior with the new expansion logic). What changes from one example to the next is where the options are specified.

<table>
<thead>
<tr>
<th><strong>bazelrc</strong></th>
<th><strong>Command Line</strong></th>
<th><strong>Current final value</strong></th>
<th><strong>New final value</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><p><pre>
<empty>
</pre></p>

</td>
<td><p><pre>
--nofoo 
--foo
--bar 
--nobar 
</pre></p>

</td>
<td><p><pre>
--foo 
--nobar
</pre></p>

</td>
<td><p><pre>
--foo 
--nobar
</pre></p>

</td>
</tr>
<tr>
<td><p><pre>
# Config definitions 
build:all --foo
build:all --bar
</pre></p>

</td>
<td><p><pre>
--nofoo 
--config=all 
--nobar 
</pre></p>

</td>
<td><p><pre>
--nofoo
--nobar
</pre></p>

</td>
<td><p><pre>
--foo 
--nobar
</pre></p>

</td>
</tr>
<tr>
<td><p><pre>
# Set for every build
build --nofoo
build --config=all
build --nobar
<br>
# Config definitions 
build:all --foo
build:all --bar
</pre></p>

</td>
<td><p><pre>
<empty>
</pre></p>

</td>
<td><p><pre>
--foo
--bar
</pre></p>

</td>
<td><p><pre>
--foo 
--nobar
</pre></p>

</td>
</tr>
</tbody>
</table>

Now to make this more complicated, what if a config includes another config? 

<table>
<tr>
<th><strong>bazelrc</strong></th>
<th><strong>Command Line</strong></th>
<th><strong>Current final value</strong></th>
<th><strong>New final value</strong></th>
</tr>
<tr>
<td rowspan="2">
<p><pre>
# Config definitions 
build:combo --nofoo
build:combo --config=all
build:combo --nobar
build:all --foo
build:all --bar
</pre></p>
</td>
<td>
<p><pre>
--config=combo 
</pre></p>
</td>
<td>
<p><pre>
--foo 
--bar
</pre></p>
</td>
<td>
<p><pre>
--foo 
--nobar
</pre></p>
</td>
</tr>
<tr><!-- 
<td></td> -->
<td>
<p><pre>
--config=all
--config=combo 
</pre></p>
</td>
<td>
<p><pre>
--nofoo
--nobar
</pre></p>
</td>
<td>
<p><pre>
--foo 
--nobar
</pre></p>
</td>
</tr>	
</table>

Here, counterintuitively, including `--config=all` explicitly makes its values effectively disappear. This is why it is basically impossible to create an automatic migration script to run on your rc - there's no real way to know what the _intended_ behavior is.  
Unfortunately, it gets worse, especially if you have the same config for different commands, such as build and test, or if you defined these in different files. It frankly isn't worth going into the further detail of the ordering semantics as it's existed up until now, this should suffice to demonstrate why it needs to change.  
To understand the order of your configs specifically, run Bazel as you normally would (remove targets for speed) with the option `--announce_rc`. The order in which the config expansions are output to the terminal is the order in which they are currently interpreted (again, between rc and command line). 

