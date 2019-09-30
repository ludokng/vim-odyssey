# Changelog

All notable changes to this project will be documented in this file. This
project adheres to [Semantic Versioning].

## [1.0.0] - 2019-09-30

### Added

- Add a 'Features' section to the README to list and describe the main features
  of the color scheme.

## [0.7.0] - 2019-09-30

### Added

- Add some support for the JavaScript language. It mainly deals with the
  highlight of function/method calls and declarations.

## [0.6.0] - 2019-09-30

### Added

- Add some support for the Go language. It mainly deals with the highlight of
  function/method calls and declarations.

### Changed

- Changed the syntax groups used to match Java enum values:

  + `javaOdysseyEnumConstructor` has been removed.

  + `javaOdysseyEnumValue` does now match all uppercase words and it is linked
    to the `Type` highlight group.

- Changed the color scheme for Ruby files:

  + Ruby booleans, 'nil', numbers and string delimitiers are using the `Normal`
    syntax group.

  + `rubySymbol` are relinked to `rubyConstant`.

  + Some Ruby keywords are relinked to `Statement` to make the scheme more
    coherent.

## [0.5.0] - 2019-09-17

### Added

- Add some supports for the Python programming language. The use of highlights
  for builtin elements have been disabled by the instruction:

  ```
  let g:python_no_builtin_highlight = 1
  ```

  Plus, The `print` function is considered to be a function and not a
  statement. It means that there is no support for Python 2 `print` statement.

- Add some supports for the Rust programming language:

  + Some already existing syntax groups have been cleared to provide
    highlighting only for important items.

  + Some syntax groups have been linked to other highlight groups to beautify
    the code.

  + Some new syntax groups for types and functions have been added.

- Add the support for the Java method references by using the `Type` and
  `Function` highlight groups.

- Add three Java syntax groups in order to be able to fold multiline
  comments, `import` statement blocks and `import static` statement blocks.

### Changed

- The highlighting of the Javadoc is prevented by default. If the user wants to
  enable it, the following lines must be added to the `.vimrc` file:

  ```
  let g:odyssey_java_javadoc = 1
  colorscheme odyssey
  ```

  *Note*: `g:odyssey_java_javadoc` must be different from `0` to enable the
  highlighting of the Javadoc.

- Change the name of some of the Java syntax group added by the plugin.

  + `javaOdysseyImport` becomes `javaOdysseyGetClass`,

  + `javaOdysseyStaticMethod` becomes `javaOdysseyGetStaticMethod`,

  + `javaOdysseyStaticClass` becomes `javaOdysseyGetStaticClass`,

  + `javaOdysseyDottedClass` becomes `javaOdysseyDotOperator`.

### Fixed

- Fix the Java highlight for the `val` keyword within lambdas bodies. This fix
  should also have fix the highlight of `val` in other snippets of Java code.

- Fix the Java highlight for nested class names in `import` statements.

## [0.4.0] - 2019-08-02

### Added

- Supports for the **Java** programming language have been added.

  + Syntax for the 'import' and 'import static' statements have been added.

  + Syntax rules for the type and classe names have been added. Everything that
    matches the regexp "\u\w*" is globally considered to be a type or a class
    name.

  + Syntax rules for the enum values have been added. Everything that matches
    the regexp "\u\w\+" is globally considered to be an enum value or a
    constant. It must be noted that "\u" will be highlight as a type because it
    is mostly used for type parametrization in generics.

- Supports for the **Ruby** programming language have been added.

  + 'require', 'def' and 'class' are highlighted as statements.

  + Class and instance variables are highlighted in orange.

  + String delimiters are highlighted as constants and string interpolation
    delimiters are highlighted as functions.

### Changed

- The color of the highlight groups 'StorageClass', 'Structure' and 'Typedef'
  have been modified. They are now colorized with the cyan colors.

- The highlight group 'Type' is no more italic, but its attribute has been
  reset to normal.

## [0.3.0] - 2019-03-16

### Changed

- The `ErrorMsg`, `WarningMsg`, `Error`, `Todo` syntax groups are now
  bold.

- The color name yellow for the constants has been modified and is now used for
  the types with a hue of 70.

  The color named cyan and blue have also been modified by increasing their
  hue, and their respective values are 180 and 210.

  Plus, the same has happened to the colors named red and orange whose hues are
  now at 10 and 40.

  |  Color  |    Name   |     Main usage    | Hue | Saturation | Value |
  | ------- | --------- | ----------------- | --- | ---------- | ----- |
  | #b37062 |       red |          ErrorMsg |  10 |     45     |   70  |
  | #b39862 |    orange |        WarningMsg |  40 |     45     |   70  |
  | #a5b362 |    yellow |              Type |  70 |     45     |   70  |
  | #62b3b3 |      cyan |           Keyword | 180 |     45     |   70  |
  | #62a8b3 |      blue |          Constant | 210 |     45     |   70  |

## [0.2.0] - 2019-03-09

### Added

- Add support for 256-colors terminal.

  + If 8-bits colors are required, the following must be used in `.vimrc`:

    ```vim
    set termguicolors
    colorscheme odyssey
    ```

  + If 24-bits colors are required, the following must be used `.vimrc`:

    ```vim
    set t_Co=256
    colorscheme odyssey
    ```

- Add the highlight for the default syntax group names Cursor and lCursor.
  Those are basically the opposite of Normal.

### Changed

- The color named violet associated to the constants has been changed because
  in some it was difficult to read (Number composed of one digit, for example).
  A more greenish color is now used.

  The violet color is removed, and the yellow-green color is added.

  |    Color    |    Name    |     Main usage    |  Hue  | Saturation | Value |
  | ----------- | ---------- | ----------------- | ----- | ---------- | ----- |
  |     #add590 |     yellow |          Constant |   95  |     45     |   70  |
  | ~~#6270b3~~ | ~~violet~~ |      ~~Constant~~ |~~230~~|   ~~45~~   | ~~70~~|

- The highlight for MatchParen has been modified. In fact, when the cursor is
  over a parenthese, a bracket, a brace, and so on, the matching element turns
  'orange' and is underlined.

  This may solves the problem of the disappearing cursor in some terminals when
  it is over a parenthese, bracket or brace.

## 0.1.0 - 2019-03-04

### Added

- Add the all of the default highlight groups for the syntax and for the
  editor. Plus their respective attributes are also set.

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

[0.7.0]: https://github.com/ludokng/vim-odyssey/compare/0.6.0...0.7.0
[0.6.0]: https://github.com/ludokng/vim-odyssey/compare/0.5.0...0.6.0
[0.5.0]: https://github.com/ludokng/vim-odyssey/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/ludokng/vim-odyssey/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/ludokng/vim-odyssey/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/ludokng/vim-odyssey/compare/0.1.0...0.2.0
[Semantic Versioning]: https://semver.org/spec/v2.0.0.html
