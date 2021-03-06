---
$schema: "../../.schema.json"
title: "Send metrics to Prometheus"
description: "A simple guide to send metrics to Prometheus in just a few minutes."
author_github: https://github.com/binarylogic
cover_label: "Prometheus Integration"
tags: ["type: tutorial","domain: sinks","sink: prometheus"]
hide_pagination: true
---

import ConfigExample from '@site/src/components/ConfigExample';
import DaemonDiagram from '@site/src/components/DaemonDiagram';
import InstallationCommand from '@site/src/components/InstallationCommand';
import Jump from '@site/src/components/Jump';
import Steps from '@site/src/components/Steps';

Metrics are an _essential_ part of observing any
service; without them you are flying blind. But collecting and analyzing them
can be a real challenge -- especially at scale. Not only do you need to solve
the basic task of collecting your metrics, but you must do it
in a reliable, performant, and robust manner. Nothing is more frustrating than
having your metrics pipeline fall on it's face during an
outage, or even worse, disrupt more important services!

Fear not! In this guide we'll show you how to send send metrics to [Prometheus][urls.prometheus]
and build a metrics pipeline that will be the backbone of
your observability strategy.

<!--
    THIS FILE IS AUTOGENERATED!

    To make changes please edit the template located at:

    guides/integrate/sinks/prometheus.md.erb
-->

## Background

### What is Prometheus?

[Prometheus][urls.prometheus] is a pull-based monitoring system that scrapes metrics from configured endpoints, stores them efficiently, and supports a powerful query language to compose dynamic information from a variety of otherwise unrelated data points.

## Strategy

### How This Guide Works

We'll be using [Vector][urls.vector_website] to accomplish this task. Vector
is a [popular][urls.vector_stars] [open-source][urls.vector_repo] utility for
building observability pipelines. It's written in [Rust][urls.rust], making it
lightweight, [ultra-fast][urls.vector_performance] and highly reliable. And
we'll be deploying Vector as a
[daemon][docs.strategies#daemon].

The [daemon deployment strategy][docs.strategies#daemon] is designed for data
collection on a single host. Vector runs in the background, in its own process,
collecting _all_ data for that host.
Typically data is collected from a process manager, such as Journald via
Vector's [`journald` source][docs.sources.journald], but can be collected
through any of Vector's [sources][docs.sources].
The following diagram demonstrates how it works.

<DaemonDiagram
  platformName={null}
  sourceName={null}
  sinkName={"prometheus"} />

### What We'll Accomplish

To be clear, here's everything we'll accomplish in this short guide:

<ul className="list--icons list--icons--checks list--indent">
  <li>
    Collect your metrics from one or more sources
  </li>
  <li>
    Expose an endpoint that Prometheus can scrape for metrics data.
    <ul>
      <li>Automatically aggregate metrics at the edge for improved performance.</li>
    </ul>
  </li>
  <li className="list--icons--arrow text--pink text--bold">All in just a few minutes!</li>
</ul>

## Tutorial

<Steps headingDepth={3}>
<ol>
<li>

### Install Vector

<InstallationCommand />

Or choose your [preferred method][docs.installation].

</li>
<li>

### Configure Vector

<ConfigExample
  format="toml"
  path={"vector.toml"}
  sourceName={"statsd"}
  sinkName={"prometheus"} />

</li>
<li>

### Start Vector

```bash
vector --config vector.toml
```

That's it! Simple and to the point. Hit `ctrl+c` to exit.

</li>
</ol>
</Steps>

## Next Steps

Vector is _powerful_ utility and we're just scratching the surface in this
guide. Here are a few pages we recommend that demonstrate the power and
flexibility of Vector:

<Jump to="https://github.com/timberio/vector" leftIcon="github" target="_blank">
  <div className="title">Vector Github repo <span className="badge badge--primary"><i className="feather icon-star"></i> 4k</span></div>
  <div className="sub-title">Vector is free and open-source!</div>
</Jump>

<Jump to="/guides/getting-started/" leftIcon="book">
  <div className="title">Vector getting started series</div>
  <div className="sub-title">Go from zero to production in under 10 minutes!</div>
</Jump>

<Jump to="/docs/about/what-is-vector/" leftIcon="book">
  <div className="title">Vector documentation</div>
  <div className="sub-title">Thoughtful, detailed docs that respect your time.</div>
</Jump>

[docs.installation]: /docs/setup/installation/
[docs.sources.journald]: /docs/reference/sources/journald/
[docs.sources]: /docs/reference/sources/
[docs.strategies#daemon]: /docs/setup/deployment/strategies/#daemon
[urls.prometheus]: https://prometheus.io/
[urls.rust]: https://www.rust-lang.org/
[urls.vector_performance]: https://vector.dev/#performance
[urls.vector_repo]: https://github.com/timberio/vector
[urls.vector_stars]: https://github.com/timberio/vector/stargazers
[urls.vector_website]: https://vector.dev
