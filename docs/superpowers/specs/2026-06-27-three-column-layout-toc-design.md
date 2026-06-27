# Three-Column Layout with TOC - Design Spec

## Summary

Modify `_layouts/default.html` to implement a three-column layout:
- **Left sidebar**: Site navigation (sticky), listing all pages grouped by directory
- **Center**: Main content, widened
- **Right sidebar**: Auto-generated TOC from page headings (sticky)

## Layout

```
┌──────────┬────────────────────────────┬──────────┐
│  Left    │       Center               │  Right   │
│  Nav     │       Content              │  TOC     │
│  (~200px)│       (flex-grow)          │  (~220px)│
│  sticky  │                            │  sticky  │
└──────────┴────────────────────────────┴──────────┘
```

- Overall container: `max-width: 1500px`, centered
- Responsive: sidebars hidden below 1024px

## Implementation

Single file change: `_layouts/default.html`

### CSS
- Flexbox three-column layout
- Left column: ~200px, sticky top, border-right
- Center column: flex-grow, contains main content
- Right column: ~220px, sticky top, border-left
- Media query at 1024px: hide sidebars, single column

### JavaScript (TOC)
- On page load, extract all h1-h4 elements from `.content` area
- Build nested TOC list with indentation by heading level
- Click to smooth-scroll to heading
- Highlight current section on scroll (IntersectionObserver)

### Navigation
- Site title at top
- Links to all pages grouped by directory (QihengDK-CAPITAL, 其他)
- Highlight current page
