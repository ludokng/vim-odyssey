# Changelog
All notable changes to this project will be documented in this file. This
project adheres to [Semantic Versioning].

## 0.1.0 - 2019-03-04

### Added

- Add the all of the default highlight groups for the syntax and for the
  editor.

- Add the 12-color palette of the Odyssey color scheme.

  |  Color  |     Main usage    | Hue | Saturation | Value |
  | ------- | ----------------- | --- | ---------- | ----- |
  | #0c0f0f |         VertSplit | 177 |     20     |    6  |
  | #161c1c |      'background' | 177 |     20     |   11  |
  | #1f2928 |        CursorLine | 177 |     25     |   16  |
  | #283635 |            Folded | 177 |     25     |   21  |
  | #808c8c |            LineNr | 177 |      9     |   55  |
  | #aabfbe |      'foreground' | 177 |     11     |   75  |
  | #62b3a5 |           Keyword | 170 |     45     |   70  |
  | #b36262 |          ErrorMsg |   0 |     45     |   70  |
  | #b3a862 |        WarningMsg |  30 |     45     |   70  |
  | #62b37d |          Function | 140 |     45     |   70  |
  | #6298b3 |              Type | 200 |     45     |   70  |
  | #6270b3 |          Constant | 230 |     45     |   70  |

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
