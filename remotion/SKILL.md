---
name: remotion-best-practices
description: Router for Remotion video skills. Covers creating, animating, previewing, captioning, and rendering videos.
version: 4.0.525
---

Trimmed from the official remotion-dev/skills for basic video work. Only create, markup, multimedia, captions, studio, and render guides are included. This machine uses bun, so all commands are `bunx ...` and `bun install`.

## Preserve user changes

Users may make edits in the code outside of the conversation.

If you detect a surprising change made in the meanwhile, don't overwrite it, assume it was intentional or ask for confirmation.

## Creating a video

If the user asks to make, create, or build a new video or composition, load [Create a new Remotion video](./remotion-create/REFERENCE.md), whether or not a Remotion project already exists.

## New project setup

If no Remotion project currently exists, load [Create a new Remotion project](./remotion-create/REFERENCE.md)

## React Markup Best Practices

If you are writing Remotion React Markup, load [Remotion Markup Best Practices](./remotion-markup/REFERENCE.md)

## Multimedia

For achieving multimedia tasks in the browser, such as trimming, cropping videos, or getting metadata from them, load [Remotion Multimedia](./remotion-multimedia/REFERENCE.md)

## Rendering

For rendering beyond simple `bunx remotion render`, see: [Rendering Best Practices](./remotion-render/REFERENCE.md)

## Opening Remotion Studio

To launch a project in Remotion Studio, open its exact local URL, or configure Studio CLI flags, load [Remotion Studio](./remotion-studio/REFERENCE.md).

## Captions

When working with Captions, load [Remotion Captions](./remotion-captions/REFERENCE.md).
