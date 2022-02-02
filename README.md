This repo is part of the _Walkability Perception and its Relations to Scenery Elements and Socio-Demographics  – A Study based on Street View Imagery and Automatic Image Interpretation_ research project.
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-4-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Project contains  all the code and data aimed to analyse a survey on perceived walkability.

## Who are we? 

Dr Tessio Novack, Dr James Tripp and Dr Carlos Camara Menoyo. We are researchers from the 
[University of Warwick](https://warwick.ac.uk). 
 
## What are our interests? 

This study examines ‘walkability’. Specifically, what makes an area seem more or less walkable? 
 

## Installation

1. Clone this repo: `git clone git@github.com:WarwickCIM/walkability_gsv.git`
2. Install `renv` if not already installed (instructions [here](https://rstudio.github.io/renv/index.html)).
2. Run `renv::restore()` to restore the state of your project from `renv.lock`.

## Updating packages

1. Install packages as usual.
2. Run `renv::snapshot()` to update `renv.lock`.
3. Create a commit with `renv.lock` changes and push it to the repo.

## Folder structure

``` bash
.
├── analyses      -> rmd files containing reports, papers...
├── data          -> data files
│   └── data-raw  -> original, raw data
├── man           -> documentation autogerated from comments
├── R             -> functions used in the project
└── renv          -> r environment, for reproducible code (ignored from repo)
```

## Troubleshooting

If facing issues installing packages from Windows, run this command. (more info [in `renv` documentation](https://rstudio.github.io/renv/articles/renv.html#downloads-1) and [in this discussion](https://community.rstudio.com/t/cant-install-packages-with-renv/96696/6))

```R
Sys.setenv(RENV_DOWNLOAD_METHOD = "libcurl")
```

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/tessjazz"><img src="https://avatars.githubusercontent.com/u/9252672?v=4?s=100" width="100px;" alt=""/><br /><sub><b>tessjazz</b></sub></a><br /><a href="#ideas-tessjazz" title="Ideas, Planning, & Feedback">🤔</a> <a href="#userTesting-tessjazz" title="User Testing">📓</a></td>
    <td align="center"><a href="https://warwick.ac.uk/fac/arts/research/digitalhumanities/team/"><img src="https://avatars.githubusercontent.com/u/5781056?v=4?s=100" width="100px;" alt=""/><br /><sub><b>James Tripp</b></sub></a><br /><a href="#ideas-jamestripp" title="Ideas, Planning, & Feedback">🤔</a> <a href="#userTesting-jamestripp" title="User Testing">📓</a></td>
    <td align="center"><a href="http://carloscamara.es"><img src="https://avatars.githubusercontent.com/u/706549?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Carlos Cámara</b></sub></a><br /><a href="https://github.com/WarwickCIM/walkability_survey/commits?author=ccamara" title="Code">💻</a> <a href="#ideas-ccamara" title="Ideas, Planning, & Feedback">🤔</a> <a href="#userTesting-ccamara" title="User Testing">📓</a></td>
    <td align="center"><a href="https://github.com/Tiaspetto"><img src="https://avatars.githubusercontent.com/u/11329784?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Codex Xiang</b></sub></a><br /><a href="#ideas-tiaspetto" title="Ideas, Planning, & Feedback">🤔</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
