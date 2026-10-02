# Herta branch changes

This branch follows upstream docking. Upstream copyright and license notices remain unchanged.

- Font rendering aligns text origins to physical pixels at the draw list's pixel density, avoiding extra filtering at fractional scale. `ImDrawListFlags_TextNoPixelSnap` still opts out.
- `ImDrawListSplitter::SwapChannels(draw_list, channel_a, channel_b)` exchanges channel contents without changing shared vertices or the current channel index. It synchronizes command headers and index write pointers so drawing can continue before `Merge`. Both indices must belong to the active split.
- Horizontal sliders draw their value as a `SliderGrab` fill from the left edge, with frame rounding, instead of a grab block that covers the value text. Vertical sliders keep the grab.

The fork does not own Herta's glass rendering, themes, editor widgets, or platform policy. Channel-reordering regression tests run in Herta's `HertaTests` target.
