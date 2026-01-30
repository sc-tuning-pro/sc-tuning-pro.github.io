---
title: SC Tuning
---

{{< blocks/cover title="SC Tuning" image_anchor="top" height="full" color="dark" >}}
<div class="mx-auto">
	<a class="btn btn-lg btn-primary mr-3 mb-4" href="{{< relref "/docs" >}}">
		Documentation
	</a>
	<a class="btn btn-lg btn-secondary mr-3 mb-4" href="{{< relref "/changelog" >}}">
		Changelog
	</a>
	<p class="lead mt-5">
		Realtime telemetry capture and analysis for Forza Motorsport 7.<br>
		Turning raw data into tuning insights.
	</p>
</div>
{{< /blocks/cover >}}

{{% blocks/lead color="primary" %}}
SC Tuning captures telemetry from Forza Motorsport 7 at 60Hz, processes it through a metrics pipeline, and visualizes the results. The goal: close the loop between driving, data, and tuning decisions.
{{% /blocks/lead %}}

{{< blocks/section color="dark" >}}
{{% blocks/feature icon="fa-gauge-high" title="Realtime Capture" %}}
85 telemetry fields decoded every 16 milliseconds. Speed, tire temps, suspension, inputs, and more.
{{% /blocks/feature %}}

{{% blocks/feature icon="fa-chart-line" title="Metrics Pipeline" %}}
9 production metrics. REST API with pagination. SSE streaming for live data.
{{% /blocks/feature %}}

{{% blocks/feature icon="fa-cogs" title="Analysis Tools" %}}
Session replay, lap comparison, and diagnostic rules to surface what matters.
{{% /blocks/feature %}}
{{< /blocks/section >}}

{{< blocks/section >}}
<div class="col-12">
<h2 class="text-center mb-4">How It Started</h2>
<p class="text-center col-lg-8 mx-auto">
After years of racing in Forza, I found the "Data Out" option buried in the settings. Telemetry I could capture and analyze? I spent the next two weeks coding instead of racing. Nine months later, I'm still hooked.
</p>
<p class="text-center col-lg-8 mx-auto">
SC Tuning is my exploration of what happens when you apply realtime systems engineering to sim racing. The data is rich, the feedback loop is immediate, and the lessons apply far beyond racing games.
</p>
</div>
{{< /blocks/section >}}

{{< blocks/section color="dark" >}}
<div class="col-12">
<h2 class="text-center mb-4">Current Status</h2>
<div class="col-lg-8 mx-auto">

| Component | Status |
|-----------|--------|
| Telemetry Receiver | Operational |
| Metrics API | Operational |
| Dashboard | In Development |

**Version:** 0.5.0 alpha (Epic 5 in progress)

**Last verified:** 2026-01-29

</div>
</div>
{{< /blocks/section >}}
