# Changelog
All notable changes to this project will be documented in this file. This
project adheres to [Semantic Versioning].

## 0.1.0 - 2019-03-04

### Added

- Add the all of the default highlight groups for the syntax and for the
  editor.

- Add the 12-color palette of the Odyssey color scheme.

  |  Color  |    Name   |     Main usage    | Hue | Saturation | Value |
  | ------- | --------- | ----------------- | --- | ---------- | ----- |
  | #0c0f0f |    bgdark |         VertSplit | 177 |     20     |    6  |
  | #161c1c |        bg |      'background' | 177 |     20     |   11  |
  | #1f2928 |   bglight |        CursorLine | 177 |     25     |   16  |
  | #283635 | bglighter |            Folded | 177 |     25     |   21  |
  | #808c8c |    fgdark |            LineNr | 177 |      9     |   55  |
  | #aabfbe |        fg |      'foreground' | 177 |     11     |   75  |
  | #62b3a5 |      cyan |           Keyword | 170 |     45     |   70  |
  | #b36262 |       red |          ErrorMsg |   0 |     45     |   70  |
  | #b38a62 |    orange |        WarningMsg |  30 |     45     |   70  |
  | #62b37d |     green |          Function | 140 |     45     |   70  |
  | #6298b3 |      blue |              Type | 200 |     45     |   70  |
  | #6270b3 |    violet |          Constant | 230 |     45     |   70  |

- Add the prerequisites to use the colorscheme.

  + When Vim is used in a terminal, the 'termguicolors' feature must available
    and it must be set on. In other words, the color scheme must be used as
    followed.

  ```vim
  set termguicolors
  colorscheme odyssey
  ```

  + A ISO-8613-3 compatible terminal is required.

  + Otherwise, a GUI version of Vim must be used.

[Semantic Versioning]: https://semver.org/spec/v2.0.0.html
