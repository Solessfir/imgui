# Herta branch changes

This branch follows upstream docking. Upstream copyright and license notices remain unchanged.

- Font rendering aligns text origins to physical pixels at the draw list's pixel density, avoiding extra filtering at fractional scale. `ImDrawListFlags_TextNoPixelSnap` still opts out.
- `ImDrawListSplitter::SwapChannels(draw_list, channel_a, channel_b)` exchanges channel contents without changing shared vertices or the current channel index. It synchronizes command headers and index write pointers so drawing can continue before `Merge`. Both indices must belong to the active split.
- Horizontal sliders draw their value as a `SliderGrab` fill from the left edge, instead of a grab block that covers the value text. The fill is the frame's rounded shape clipped at the value, so short values keep the rounded left edge. Vertical sliders keep the grab.
- Checkboxes size their box to the font (at most the frame height) and center it on the frame row, so large frame padding does not inflate them.
- Combos draw one frame with a chevron instead of a separately filled arrow button.
- Close buttons use a rounded hover background and a smaller cross that dims when not hovered.
- Check marks use a thinner stroke (`sz / 7`). Menu item marks are smaller and use `ImGuiCol_CheckMark` instead of the text color.
- `RenderArrow()` draws a thin chevron instead of a filled triangle, so tree nodes, collapsing headers, submenus, and arrow buttons share the combo chevron style.
- Proportional table stretch weights (`ImGuiTableFlags_SizingStretchProp`) fall back to equal weights while no column has measured content, instead of dividing 0 by 0 on a table's first frame. The NaN weight otherwise reaches window content sizes and trips UBSan.

The fork does not own Herta's glass rendering, themes, editor widgets, or platform policy. Channel-reordering regression tests run in Herta's `HertaTests` target.
