-- heading-fix.lua
-- Quarto renders a callout's "## Title" as a plain <div class="callout-title-container">,
-- which strips the heading semantics screen-reader users rely on to navigate by heading.
-- This filter retrofits heading semantics via role="heading" + aria-level, without
-- changing Quarto's markup structure, styling, or callout JS behavior.

local heading_level = "2"

function Div(el)
  for _, class in ipairs(el.classes) do
    if class == "callout-title-container" then
      el.attributes["role"] = "heading"
      el.attributes["aria-level"] = heading_level
      return el
    end
  end
end