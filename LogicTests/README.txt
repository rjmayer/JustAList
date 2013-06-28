= Where are the tests? =

Apart from an example, it might look like there are no tests. Wrong. In fact, quite the opposite; Unit-Test classes are stored next to the respective code classes (usually in a group named Tests).

The reason for that is too easily keep an eye on code coverage. When working on code, the corresponding test classes should be immediately visible and to hand. Also, if I see several class files without a "Tests" group next to them, then I can immedtiately see that tests are missing.