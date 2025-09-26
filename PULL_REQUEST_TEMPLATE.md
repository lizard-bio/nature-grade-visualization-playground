## BioLizardStyleR

- [ ]  unit testing: run `devtools::test()` from root dir of the package (BioLizardStyleR folder)
- [ ]  adjust documentation
    - [ ]  Vignette
    - [ ]  re-create function-specific documentation: run `devtools::document()` from the package root dir
    - [ ]  in_Action file in root of the repo
    - [ ]  README in the root of the repo
- [ ]  describe changes in NEWS.md
- [ ]  bump up version number
- [ ]  Run `devtools::check(args = c("--no-examples"))` before pushing
    - note: throws some font errors related to postscript font database, but everything seems to work.. running `devtools::check(args = c("--no-examples"))` omits the examples and avoids this error

## BioLizardStylePython

- [ ]  run unit testing in clean environment: run `pytest` from root dir of the package (BioLizardStylePython folder)
- [ ]  adjust documentation:
    - [ ]  python package README
    - [ ]  notebooks in docs/ folder
    - [ ]  re-build the documentation with sphinx: run `make clean html`  from the docs/ folder
    - [ ]  in_Action file in root of the repo
    - [ ]  README in the root of the repo
- [ ]  describe changes in CHANGELOG.md
- [ ]  bump up version number
- [ ]  build new release for python package
    
    ```bash
    python3 -m pip install --upgrade build
    python3 -m build
    ```
    
- [ ]  publish new release of python package on testpypi. run in root dir of the package:
    
    ```bash
    # install twine
    python3 -m pip install --upgrade twine
    #check on testPypi
    python3 -m twine upload --repository testpypi dist/biolizardstylepython-<version>*
    ```
    
    Note: may need to run `pip install -U packaging` to get twine working:
    
    https://github.com/pypa/twine/issues/1216
    
    Once uploaded, package should be viewable on TestPyPI: https://test.pypi.org/project/BioLizardStylePython 
    
    install package from testpypi in clean environment & check if everything works:
    
    ```bash
    python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps BioLizardStylePython
    ```

## After release of a new version (merge into main)

- [ ]  adjust the docs on github pages: add/replace the html files in the docs folder on the github-pages branch: https://github.com/lizard-bio/nature-grade-visualization-playground/tree/github-pages/docs
    
    ```bash
    #check out branch
    git checkout github-pages
    
    # python docs
    # update from main
    git checkout main -- BioLizardStylePython/docs/
    # copy to docs/ folder
    cp -r BioLizardStylePython/docs/_build/html/* docs/BioLizardStylePython/
    
    # R docs
    # update from main
    git checkout main -- BioLizardStyleR/vignettes/
    # render html file of the vignette
    Rscript -e "rmarkdown::render('BioLizardStyleR/vignettes/BioLizardStyleR.Rmd')"
    # copy vignette to docs/ folder
    cp BioLizardStyleR/vignettes/BioLizardStyleR.html docs/BioLizardStyleR/index.html
    ```
    
    Then push changes to github & go to https://lizard-bio.github.io/nature-grade-visualization-playground/ and **check** if docs are rendered correctly. 
    
- [ ]  Publish python package on pypi. run in root dir of the python package:
    
    ```bash
    python3 -m twine upload dist/biolizardstylepython-<version>*
    ```
    
