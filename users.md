---
layout: contribute
title: Who's Using Bazel
---

# Who's Using Bazel

*Using Bazel? You can add your company on [StackShare](https://stackshare.io/bazel).
To add yourself to this page, contact [product@bazel.build](mailto:produc@bazel.build).*

This page lists companies and OSS projects that are known to use Bazel. This does not constitute an endorsement.

## Companies using Bazel

### [acqio](https://acqio.com.br)

<img src="/images/user-logos/acqio_logo.svg" width="150" align="right">

Acqio is a Fintech that provides payment products and services for small and medium merchants. Acqio has a handful of monorepos and uses Bazel along with Kubernetes to deliver fast and reliable microservices.

### [Adobe](https://www.adobe.com/)

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Adobe_logo_and_wordmark_%282017%29.svg/440px-Adobe_logo_and_wordmark_%282017%29.svg.png" width="150" align="right">

Adobe has released Bazel [rules](https://github.com/adobe/rules_gitops) for continuous, GitOps driven Kubernetes deployments.

### [Asana](https://asana.com)

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Asana_logo.svg/256px-Asana_logo.svg.png" width="100" align="right">
Asana is a web and mobile application designed to help teams track their work.
In their own words: 

> Bazel has increased reliability, stability, and speed for all of builds/tests at Asana. We no longer need to clean because of incorrect caches.


### [Ascend.io](https://ascend.io)

Ascend is a Palo Alto startup that offers solutions for large data sets analysis. Their motto is _Big data is hard. We make it easy_.

### [Beeswax](https://www.beeswax.com/)

"_Beeswax is a New York based startup that provides real time bidding as service. Bazel powers their Jenkins based continuous integration and deployment framework. Beeswax loves Bazel because it is blazingly fast, correct and well supported across many languages and platforms._"

### [Braintree](https://www.braintreepayments.com)
<img src="https://upload.wikimedia.org/wikipedia/commons/0/00/Braintree-logo1.png" width="150" align="right">

Braintree, a PayPal subsidiary, develops payment solutions for websites and applications. They use Bazel for parts of their internal build and Paul Gross even posted a [nice piece about how their switch to Bazel went](https://www.pgrs.net/2015/09/01/migrating-from-gradle-to-bazel/).

### [Canva](https://www.canva.com/)
<img src="https://upload.wikimedia.org/wikipedia/en/3/3b/Canva_Logo.png" width="90" align="right">

Canva leverages Bazel to manage its large polyglot codebase, which includes Java, Typescript, Scala, Python, and more. Migration to Bazel has delivered significant developer and compute infrastructure efficiencies, for example 5-6x decreases in average CI build times, and it continues to become the foundation of fast, reproducible, and standardised software builds at the company.

### [CarGurus](https://www.cargurus.com)
<img src="https://www.cargurus.com/gfx/reskin/logos/logo_CarGurus.svg" width="150" align="right">

CarGurus is on a mission to build the world's most trusted and transparent automotive marketplace and uses Bazel to build their polyglot monorepo.

### [Compass](https://www.compass.com)

Compass is a tech-driven real estate platform. With an elite team of real estate, technology and business professionals, we aim to be the best and most trusted source for home seekers.

### [Databricks](https://databricks.com)

<img src="https://upload.wikimedia.org/wikipedia/en/0/09/Databricks_logo.png" width="100" align="right">
Databricks provides cloud-based integrated workspaces based on Apache Spark™.

> The Databricks codebase is a Monorepo, containing the Scala code that powers most of our services, Javascript for front-end UI, Python for scripting, Jsonnet to configure our infrastructure, and much more [...] Even though our monorepo contains a million lines of Scala, working with code within is fast and snappy. ([Speedy Scala Builds with Bazel at Databricks](https://databricks.com/blog/2019/02/27/speedy-scala-builds-with-bazel-at-databricks.html))

### [Dataform](https://dataform.co)

Dataform provides scalable analytics for data teams. They maintain a handful of NPM packages and a documentation site in one single monorepo and they do it all with Bazel.

After the migration to Bazel, they [reported many benefits](https://github.com/bazelbuild/rules_nodejs#user-testimonials), including:
> * Faster CI: we enabled the remote build caching which has reduced our average build time from 30 minutes to 5 (for the entire repository). 
> * Improvements to local development: no more random bash scripts that you forget to run, incremental builds reduced to seconds from minutes
> * Developer setup time: New engineers can build all our code with just 3 dependencies - bazel, docker and the JVM. The last engineer to join our team managed to build all our code in < 30 minutes on a brand new, empty laptop

### [Deep Silver FISHLABS](https://www.dsfishlabs.com)
Deep Silver FISHLABS is a developer of high-end 3D games. They use Bazel with C++/Python/Go/C as a base for their internal build tooling and especially for baking and deploying all their 3D Assets.

### [Dropbox](https://www.dropbox.com/)
<img src="https://upload.wikimedia.org/wikipedia/commons/a/ad/Dropbox_logo_2015.svg" width="150" align="right">
At Dropbox, Bazel is a key component to our distributed build and test environment. We use Bazel to combine Typescript/Python/Go/C/Rust into reliable production releases.

### [Engel & Völkers](https://www.engelvoelkers.com)

Engel & Völkers AG is a privately owned German company that, via a series of franchised offices, provides services related to real estate transactions.

> One of our internal project has seen a decrease of compilation time from 11 minutes to roughly 1 minute, this was an impressive achievement and we are currently working on bringing Bazel to more projects.
([Experimenting with Google Cloud Build and Bazel](https://www.engelvoelkers.com/en/tech/engineering/software-engineering/experimenting-with-google-cloud-build-and-bazel/))

### [Etsy](https://www.etsy.com/)
<img src="https://upload.wikimedia.org/wikipedia/commons/a/aa/Etsy_logo_lg_rgb.png" width="150" align="right">

Etsy is an e-commerce website focused on handmade or vintage items and supplies, as well as unique factory-manufactured items.

They use Bazel to build and test its Java-based search platform. Bazel produces both packages for bare metal servers and repeatable Docker images.

### [Evertz.io](https://www.evertz.io/)

Evertz.io is a multi-tenant, serverless SaaS platform for offering cost effective, multi-regional services worldwide to the Broadcast Media Industry, created by [Evertz Microsystems](https://en.wikipedia.org/wiki/Evertz_Microsystems).

The website is fully built and deployed with an Angular and Bazel workflow ([source](https://twitter.com/MattMackay/status/1113947685508341762)).

### [FINDMINE](http://www.findmine.com)
<img src="https://www.findmine.com/static/assets/landpage/findmine-color-logo.png" width="150" align="right">
FINDMINE is a automation technology for the retail industry that uses machine learning to scale the currently manual and tedious process of product curation. We use Bazel to mechanize our entire python package building, testing, and deployment process.

### [Flexport](https://www.flexport.com/)

Flexport is a tech-enabled global freight forwarder; our mission is to make global trade easier for everyone. At Flexport, we use Bazel to build/test our Java/JavaScript services and client libraries and to generate Java and Ruby code from protobuf definitions.
[Read about how we run individual JUnit 5 tests in isolation with Bazel.](https://flexport.engineering/connecting-bazel-and-junit5-by-transforming-arguments-46440c6ea068)

### [Google](https://google.com)
<img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg" width="150" align="right">
Bazel was designed to be able to scale to Google's needs and meet Google's requirements of reproducibility and platform/language support. All software at Google is built using Bazel. Google uses Bazel and its rules for millions of builds every day.

### [GRAKN.AI](https://grakn.ai)
<img src="http://grakn.ai/assets/img/grakn-logo-name.png" alt="GRAKN AI Logo" width="150" align="right">
Grakn is a database technology that serves as the knowledge-base foundation to intelligent systems. Grakn allows intelligent systems to interpret complex datasets as a single body of knowledge that can be logically reasoned over. Bazel enables the @graknlabs team to build a highly-orchestrated CI and distribution pipeline that manages multiple repositories of multiple languages, and deploys to numerous platforms seamlessly.

### [Huawei](http://www.huawei.com/)

Huawei Technologies is using Bazel in about 30 projects, they are java/scala/go projects, except for go projects, others originally were built by maven. We write a simple tool to translate a Maven-built project into Bazel-built one. More and more projects will use Bazel in recent future.

### [IMC Trading](https://imc.com)
<img src="https://upload.wikimedia.org/wikipedia/commons/1/17/IMC_Logo.svg" width="150" align="right">
IMC is a global proprietary trading firm and market maker headquarted in
Amsterdam. We are using Bazel to continuously build and test our
Java/C++/Python/SystemVerilog projects.

### [Improbable.io](https://improbable.io/)

Improbable.io develops SpatialOS, a distributed operating system that enables creating huge simulations inhabited by millions of complex entities.

### [Interaxon](https://www.choosemuse.com/)

InteraXon is a thought-controlled computing firm that creates hardware and software platforms to convert brainwaves into digital signals.

### [Jupiter](https://jupiter.co/)

Jupiter is a company that provides delivery of groceries and household essentials every week.

They use Bazel in their backend code, specifically to compile protos and Kotlin to JVM binaries, using remote caching. ([source](https://starship.jupiter.co/jupiter-stack/))

### [Just](https://gojust.com/)

Just is an enterprise financial technology company, headquartered in Norway, creating software solutions to transform how global corporate treasurers manage risk and liquidity. Their entire application stack is built with Bazel.

### [Kitty Hawk Corporation](https://kittyhawk.aero/)

The Kitty Hawk Corporation is an American aircraft manufacturer producing electric aircraft. They use Bazel with Haskell and Scala rules.

### [Line](https://line.me/)

Line provides an app for instant communications, which is the most popular messaging application in Japan.
They use Bazel on their codebase consisting of about 60% Swift and 40% C/C++/Objective-C/Objective-C++ ([source](https://twitter.com/thi_dt/status/1253334262020886532)).

> After switching to Bazel, we were able to achieve a huge improvement in the build times. This brought a significant improvement in the turn-around time during a QA period. Distributing a new build to our testers no longer means another hour waiting for building and testing. ([Improving Build Performance of LINE for iOS with Bazel](https://engineering.linecorp.com/en/blog/improving-build-performance-line-ios-bazel/))

### [LingoChamp](https://www.liulishuo.com/en)

<img src="/images/user-logos/lingo_champ.png" width="100" align="right">
LingoChamp provides professional solutions to English learners. We use Bazel for our go, java and python projects.

### [LinkedIn](https://linkedin.com/)

<img src="/images/user-logos/linkedin_icon.jpg" width="100" align="right">
LinkedIn, a subsidiary of Microsoft, is the world’s largest professional social network. LinkedIn uses Bazel for building its iOS Apps.

### [Lyft](https://www.lyft.com/)

Lyft is using Bazel for their iOS Apps ([source](https://twitter.com/SmileyKeith/status/1116486751806033920)).

### [Makani](https://www.google.com/makani)
Makani, now a Google subsidiary, develops energy kites and uses Bazel to build their software (including their embedded C++ software).

<img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/Meetup_Logo.png" width="100" align="right">

### [Meetup](http://www.meetup.com/)

Meetup is an online social networking portal that facilitates offline group meetings.
The Meetup engineering team contributes to [rules_scala](https://github.com/bazelbuild/rules_scala) and is the maintainer of [rules_avro](https://github.com/meetup/rules_avro) and [rules_openapi](https://github.com/meetup/rules_openapi).


### [Nvidia](https://www.nvidia.com/)

> At Nvidia we have been using dazel(docker bazel) for python to work around some of bazel's python short comings. Everything else runs in normal bazel(Mostly Go/Scala/C++/Cuda) ([source](https://twitter.com/rwhitcomb/status/1080887723433447424))


### [Peloton Technology](http://www.peloton-tech.com)

Peloton Technology is an automated vehicle technology company that tackles truck accidents and fuel use. They use Bazel to _enable reliable builds for automotive safety systems_.


### [Pinterest](https://www.pinterest.com/)

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Pinterest_Logo.svg/200px-Pinterest_Logo.svg.png" width="150" align="right">

Pinterest is the world’s catalog of ideas. They use Bazel to build various backend services (Java/C++) and the iOS application (Objective-C/C++).

> We identified Bazel was the best fit for our goals to build a foundation for an order of magnitude improvement in performance, eliminate variability in build environments and adopt incrementally. As a result, we’re now shipping all our iOS releases using Bazel. [Developing fast & reliable iOS builds at PintereWt](https://medium.com/@Pinterest_Engineering/developing-fast-reliable-ios-builds-at-pinterest-part-one-cb1810407b92)

### [PubRef](https://github.com/pubref)

PubRef is an emerging scientific publishing platform.  They use Bazel with [rules_closure](https://github.com/bazelbuild/rules_closure) to build the frontend, native java rules to build the main backend, [rules_go](https://github.com/bazelbuild/rules_go), [rules_node](https://github.com/pubref/rules_node), and [rules_kotlin](https://github.com/pubref/rules_kotlin) to build assorted backend services.  [rules_protobuf](https://github.com/pubref/rules_protobuf) is used to assist with gRPC-based communication between backend services.  PubRef.org is based in Boulder, CO.  

### [Redfin](https://redfin.com/)
Redfin is a next-generation real estate brokerage with full-service local agents. They use Bazel to build and deploy the website and various backend services.

> With the conversion mostly behind us, things are greatly improved! Our CI builds are faster (*way* faster: they used to take 40–90 minutes, and now dev builds average 5–6 minutes). Reliability is far higher, too. This is harder to quantify, but the shift from unexplained build failures being something that “just happens” to being viewed as real problems to be solved has put us on a virtuous cycle of ever-increasing reliability. ([We Switched from Maven to Bazel and Builds Got 10x Faster](https://redfin.engineering/we-switched-from-maven-to-bazel-and-builds-got-10x-faster-b265a7845854))

### [Ritual](https://ritual.co)
<img src="https://lh3.googleusercontent.com/7Ir6j25ROnsXhtQXveOzup33cizxLf-TiifSC1cI6op0bQVB-WePmPjJOfXUBQ0L3KpkheObAiS28e-TS8hZtDzxOIc" width="150" align="right">

Ritual is a mobile pick up app, connecting restaurants with customers to offer a simple, time-saving tool to get the food and beverages they want, without the wait. Ritual uses Bazel for their backend services.

### [Stripe](https://stripe.com)
<img src="https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Stripe_logo%2C_revised_2016.png/320px-Stripe_logo%2C_revised_2016.png" width="150" align="right">

Stripe provides mobile payment solutions.  They are the main maintainers of the [Bazel Scala rules](https://github.com/bazelbuild/rules_scala).

### [Tink](https://tink.com/)
<img src="https://cdn.tink.se/tink-logos/LOW/Tink_Black.png" width="150" align="right">

Tink is a european fintech, building the best way to connect to banks across Europe.

They are using Bazel to build their backend services from a polyglot monorepo. Engineers at Tink are organizing the [bazel build //stockholm/...](https://www.meetup.com/BazelSTHLM/) meetup group.

### [Tokopedia](https://www.tokopedia.com/)

Tokopedia is an Indonesian technology company specializing in e-commerce, with over 90 million monthly active users and over 7 million merchants on the platform.

They wrote the article [How Tokopedia Achieved 1000% Faster iOS Build Time](https://medium.com/tokopedia-engineering/how-tokopedia-achieved-1000-faster-ios-build-time-7664b2d8ae5), where they explain how Bazel sped up their builds. The build duration went from 55 minutes to 10 minutes by using Bazel, and down to 5 minutes with remote caching.

### [Twitter](https://twitter.com/)

Twitter has made the decision to migrate from Pants to Bazel as their primary build tool ([source](https://groups.google.com/forum/#!msg/pants-devel/PHVIbVDLhx8/LpSKIP5cAwAJ)).

### [Two Sigma](https://www.twosigma.com/)
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Two_Sigma_logo.svg/2880px-Two_Sigma_logo.svg.png" width="150" align="right">

Two Sigma is a New York-headquartered technology company dedicated to finding value in the world’s data.

### [Uber](https://www.uber.com)

Uber is a ride-hailing company. With 900 active developers, Uber’s Go monorepo is likely one of the largest Go repositories using Bazel. See the article [Building Uber’s Go Monorepo with Bazel](https://eng.uber.com/go-monorepo-bazel/) to learn more about their experience.

### [Uber Advanced Technologies Group](https://www.uber.com/info/atg/)
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Uber_logo.svg/220px-Uber_logo.svg.png" width="150" align="right">

Uber Advanced Technologies Group is focused on autonomous vehicle efforts at Uber, including trucking/freight and autonomous ride sharing. The organization uses Bazel as its primary build system.

### [Vistar Media](http://vistarmedia.com)
Vistar Media is an advertising platform that enables brands to reach consumers based on their behavior in the physical world. Their engineering team is primarily based out of Philadelphia and is using Bazel for builds, deploys, to speed up testing, and to consolidate repositories written with a variety of different technologies.

### [VMware](https://www.vmware.com/)
VMware uses Bazel to produce deterministic, reliable builds while developing innovative products for their customers.

### [Wix](https://www.wix.com/)

Wix is a cloud-based web development platform. Their backend uses Java and Scala code. They use remote execution with Google Cloud Build.

> We have seen about 5 times faster clean builds when running with bazel remote execution which utilizes bazel’s great build/test parallelism capabilities when it dispatches build/test actions to a worker farm. Average build times are more than 10 times faster due to the utilization of bazel’s aggressive caching mechanism. ([Migrating to Bazel from Maven or Gradle? 5 crucial questions you should ask yourself](https://medium.com/wix-engineering/migrating-to-bazel-from-maven-or-gradle-5-crucial-questions-you-should-ask-yourself-f23ac6bca070))

### [Zenly](https://zen.ly/)

Zenly is a live map of your friends and family. It’s the most fun way to meet up — or just see what’s up! — so you can feel together, even when you're apart.


***

## Open source projects using Bazel

### [Abseil](https://abseil.io/)

Abseil is an open-source collection of C++ code (compliant to C++11) designed to augment the C++ standard library.

### [Angular](https://angular.io)

<img src="https://upload.wikimedia.org/wikipedia/commons/c/cf/Angular_full_color_logo.svg" width="120" align="right">

Angular is a popular web framework.
Angular is [built with Bazel](https://github.com/angular/angular/blob/master/docs/BAZEL.md).

### [Apollo](https://github.com/ApolloAuto/apollo)

Apollo is a high performance, flexible architecture which accelerates the development, testing, and deployment of Autonomous Vehicles.

### [brpc](https://github.com/brpc/brpc)

An industrial-grade RPC framework used throughout Baidu, with 1,000,000+ instances(not counting clients) and thousands kinds of services, called "baidu-rpc" inside Baidu.

### [cert-manager](https://github.com/jetstack/cert-manager)

cert-manager is a Kubernetes add-on to automate the management and issuance of TLS certificates from various issuing sources. It will ensure certificates are valid and up to date periodically, and attempt to renew certificates at an appropriate time before expiry.

### [CallBuilder](https://github.com/google/CallBuilder)

A Java code generator that allows you to create a builder by writing one function.

### [CPPItertools](https://github.com/ryanhaining/cppitertools)

C++ library providing range-based for loop add-ons inspired by the Python builtins and itertools library. Like itertools and the Python3 builtins, this library uses lazy evaluation wherever possible.

### [Copybara](https://github.com/google/copybara)

Copybara is a tool for transforming and moving code between repositories.

### [Dagger](https://google.github.io/dagger/)

Dagger is a fully static, compile-time dependency injection framework for both Java and Android.

### [DAML](https://github.com/digital-asset/daml)

DAML is a smart contract language for building future-proof distributed applications on a safe, privacy-aware runtime.

### [Deepmind Lab](https://github.com/deepmind/lab)

A customisable 3D platform for agent-based AI research.

### [Drake](https://github.com/RobotLocomotion/drake)

Drake is a C++ toolbox started at MIT and now led by the Toyota Research Institute. It is a collection of tools for analyzing the dynamics of our robots and building control systems for them, with a heavy emphasis on optimization-based design/analysis.

### [Envoy](https://github.com/lyft/envoy)

C++ L7 proxy and communication bus

### [Error Prone](https://github.com/google/error-prone)

Catches common Java mistakes as compile-time errors. (Migration to Bazel is in progress.)

### [Extensible Service Proxy](https://github.com/cloudendpoints/esp)

Extensible Service Proxy, a.k.a. ESP is a proxy which enables API management capabilities for JSON/REST or gRPC API services. The current implementation is based on an NGINX HTTP reverse proxy server.

### [FFruit](https://gitlab.com/perezd/ffruit/)

FFruit is a free & open source Android application to the popular service [Falling Fruit](https://fallingfruit.org).

### [Gerrit Code Review](https://gerritcodereview.com)

Gerrit is a code review and project management tool for Git based projects.

### [Gitiles](https://gerrit.googlesource.com/gitiles/)

Gitiles is a simple repository browser for Git repositories, built on JGit.

### [Grakn](https://github.com/graknlabs/grakn)

Grakn (https://grakn.ai/) is the knowledge graph engine to organise complex networks of data and make it queryable.

### [GRPC](http://www.grpc.io)
A language-and-platform-neutral remote procedure call system. (Bazel is a supported, although not primary, build system.)

### [gVisor](https://github.com/google/gvisor)
gVisor is a container runtime sandbox.

### [Guetzli](https://github.com/google/guetzli/)

Guetzli is a JPEG encoder that aims for excellent compression density at high visual quality.

### [Gulava](http://www.github.com/google/gulava/)

A Java code generator that lets you write Prolog-style predicates and use them seamlessly from normal Java code.

### [Heron](https://github.com/apache/incubator-heron)

Heron is a realtime, distributed, fault-tolerant stream processing engine from Twitter.

### [JGit](https://eclipse.org/jgit/)

JGit is a lightweight, pure Java library implementing the Git version control system.

### [Jsonnet](https://jsonnet.org/)

An elegant, formally-specified config generation language for JSON. (Bazel is a supported build system.)

### [Kubernetes](https://github.com/kubernetes/kubernetes)

<img src="https://raw.githubusercontent.com/kubernetes/kubernetes/master/logo/logo.png" width="80" align="right">
Kubernetes is an open source system for managing containerized applications across multiple hosts, providing basic mechanisms for deployment, maintenance, and scaling of applications.

### [Kythe](https://github.com/google/kythe)

An ecosystem for building tools that work with code.

### [Nomulus](https://github.com/google/nomulus)

Top-level domain name registry service on Google App Engine.

### [ONOS : Open Network Operating System](https://github.com/opennetworkinglab/onos)

<img src="https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Logo_for_the_ONOS_open_source_project.png/175px-Logo_for_the_ONOS_open_source_project.png" width="120" align="right">
ONOS is the only SDN controller platform that supports the transition from legacy “brown field” networks to SDN “green field” networks. This enables exciting new capabilities, and disruptive deployment and operational cost points for network operators.

### [PetitParser for Java](https://github.com/petitparser/java-petitparser)

Grammars for programming languages are traditionally specified statically. They are hard to compose and reuse due to ambiguities that inevitably arise. PetitParser combines ideas from scannnerless parsing, parser combinators, parsing expression grammars and packrat parsers to model grammars and parsers
as objects that can be reconfigured dynamically.

### [PlaidML](https://github.com/plaidml/plaidml)

PlaidML is a framework for making deep learning work everywhere.

### [Project V](https://www.v2ray.com/)

<img src="https://www.v2ray.com/resources/v2ray_1024.png" width="100" align="right">
Project V is a set of tools to help you build your own privacy network over internet.

### [Prysmatic Labs Ethereum 2.0 Implementation](https://github.com/prysmaticlabs/prysm)

Prysm is a sharding client for Ethereum 2.0, a blockchain-based distributed computing platform.

### [Ray](https://github.com/ray-project/ray)

Ray is a flexible, high-performance distributed execution framework.

### [Resty](https://github.com/go-resty/resty)

Resty is a Simple HTTP and REST client library for Go (inspired by Ruby rest-client).

### [Roughtime](https://roughtime.googlesource.com/roughtime)

Roughtime is a project that aims to provide secure time synchronisation.

### [Selenium](https://github.com/SeleniumHQ/selenium)

Selenium is a portable framework for testing web applications.

### [Semantic](https://github.com/github/semantic)

Semantic is a Haskell library and command line tool for parsing, analyzing, and comparing source code. It is developed by GitHub (and used for example for the code navigation).

### [Served](https://github.com/meltwater/served)

Served is a C++ library for building high performance RESTful web servers.

### [Snap](https://www.snap.com/en-US/)

Snap, the developper of Snapchat messaging app, has migrated from Buck to Bazel in 2020 ([source](https://twitter.com/wew/status/1326957862816509953)).

### [Sonnet](https://github.com/deepmind/sonnet)

Sonnet is a library built on top of TensorFlow for building complex neural networks.

### [Sorbet](https://github.com/sorbet/sorbet)

Sorbet is a fast, powerful type checker for a subset of Ruby. It scales to codebases with millions of lines of code and can be adopted incrementally.

### [Tink](https://github.com/google/tink)

Tink is a multi-language, cross-platform, open source library that provides cryptographic APIs that are secure, easy to use correctly, and hard(er) to misuse.

### [TensorFlow](http://tensorflow.org)
<img src="https://upload.wikimedia.org/wikipedia/commons/a/a4/TensorFlowLogo.png" width="150" align="right">

An open source software library for machine intelligence.

### [Turbo Santa](https://github.com/turbo-santa/turbo-santa-common)

A platform-independent GameBoy emulator.

### [Wycheproof](https://github.com/google/wycheproof)

Project Wycheproof tests crypto libraries against known attacks.

### [XIOSim](https://github.com/s-kanev/XIOSim)

XIOSim is a detailed user-mode microarchitectural simulator for the x86 architecture.

### [ZhihuDailyPurify](https://github.com/izzyleung/ZhihuDailyPurify)

ZhihuDailyPurify is a light weight version of Zhihu Daily, a Chinese question-and-answer webs
