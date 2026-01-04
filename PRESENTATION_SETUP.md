# Presentation Plugin - Setup Complete! 🎉

## Overview

I've successfully added **presenting.vim** to your Neovim configuration. This plugin allows you to create and present slides directly in Neovim using Markdown files.

## What Was Added

1. **`config/plugins/present.nix`** - Presentation plugin configuration
2. **`config/plugins/default.nix`** - Updated to import present.nix
3. **`example-presentation.md`** - Sample presentation file

## How to Use

### Creating a Presentation

1. Create a Markdown file (e.g., `my-slides.md`)
2. Start each slide with a `#` heading
3. Write your content below each heading

**Example:**
```markdown
# First Slide

This is the first slide content.

# Second Slide

This is the second slide.
- Bullet points work
- Code blocks work too

# Third Slide

```lua
print("Hello from slide 3!")
```​
```

### Starting a Presentation

1. Open your markdown file: `nvim my-slides.md`
2. Run: `:PresentingStart`
3. Navigate through slides:
   - `n` or `→` - Next slide
   - `p` or `←` - Previous slide
   - `q` - Quit presentation

### Try the Example

```bash
nvim example-presentation.md
```

Then type `:PresentingStart` and press Enter!

## Features

✅ **Simple Format** - Each slide starts with `#` heading  
✅ **Markdown Support** - Full markdown syntax  
✅ **Code Highlighting** - Syntax highlighting for code blocks  
✅ **Clean UI** - Distraction-free presentation mode  
✅ **Vim Navigation** - Use familiar Vim keys  

## Tips

- Keep slides simple and focused
- Use code blocks with language specifiers for syntax highlighting
- Lists and formatting work as expected
- Images are not supported (text-only presentations)

## Customization

The plugin uses sensible defaults. If you want to customize it further, you can add configuration in `config/plugins/present.nix`. Check the plugin documentation at: https://github.com/sotte/presenting.vim

## Build Your Neovim

The plugin is already built and ready to use! To rebuild in the future:

```bash
nix run .
```

Enjoy presenting in Neovim! 📊
