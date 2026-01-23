---
date: 2018-10-06
title: Easy documentation with Docsy
linkTitle: From Infosec to MLOps
description: >
  The Docsy Hugo theme lets project maintainers and contributors focus on content,
  not on reinventing a website infrastructure from scratch
author: Riona MacNamara ([@rionam](https://x.com/bepsays))
---

**This is a typical blog post.**

The front matter specifies the date of the blog post, its title, a short description that will be displayed on the blog landing page, and its author.

## Blog Post Structure

A typical blog post includes:
- A title and description
- Author information
- Content sections
- Links and references

## Adding Images

To add images to your blog posts, you can use standard Markdown image syntax:

```markdown
![Alt text](/path/to/image.jpg)
```

Or use Hugo's built-in image processing:

```markdown
{{</* figure src="/path/to/image.jpg" title="Image title" */>}}
``` 