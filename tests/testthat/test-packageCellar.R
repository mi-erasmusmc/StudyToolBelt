test_that("packageCellar saves single cran and github package to cellar", {
  # PREP ----------
  testLockfile <- testthat::test_path(
    "data",
    "renv.lock"
  )
  renv::lockfile_create(
    libpaths = .libPaths(),
    packages = c("DarwinShinyModules", "dplyr")
  ) |> 
    renv::lockfile_write(
      file = testthat::test_path(
        "data",
        "renv.lock"
      )
    )
  checkmate::assertFileExists(testLockfile)
  testCellarDir <- file.path(
    tempdir(),
    "test_cellar"
  )
  dir.create(testCellarDir)
  # EXECUTION -------
  packageCellar(
    lockfile = testLockfile,
    cellarDir = testCellarDir,
    type = "complete"
  )
  # TEST ------------
  list.files(
    testCellarDir
  ) |> 
    expect_equal(c("askpass_1.2.1.tgz", "backports_1.5.1.tgz", "base64enc_0.1-6.tgz", 
                   "bigD_0.3.1.tgz", "bitops_1.0-9.tgz", "blob_1.3.0.tgz", "brand.yml_0.1.0.tgz", 
                   "bslib_0.11.0.tar.gz", "cachem_1.1.0.tgz", "checkmate_2.3.4.tgz", 
                   "cli_3.6.6.tgz", "commonmark_2.0.0.tgz", "cpp11_0.5.5.tgz", "crosstalk_1.2.2.tgz", 
                   "curl_7.1.0.tgz", "DarwinShinyModules_260ebe58bc7d5e13fcdc8bc4254749abc85f0320.tar.gz", 
                   "data.table_1.18.4.tar.gz", "DBI_1.3.0.tgz", "dbplyr_2.6.0.tgz", 
                   "digest_0.6.39.tgz", "dplyr_1.2.1.tgz", "DT_0.34.0.tgz", "evaluate_1.0.5.tgz", 
                   "farver_2.1.2.tgz", "fastmap_1.2.0.tgz", "flextable_0.9.12.tar.gz", 
                   "fontawesome_0.5.3.tgz", "fontBitstreamVera_0.1.1.tgz", "fontLiberation_0.1.0.tgz", 
                   "fontquiver_0.2.1.tgz", "fs_2.1.0.tgz", "gdtools_0.5.1.tgz", 
                   "generics_0.1.4.tgz", "ggplot2_4.0.3.tgz", "glue_1.8.1.tgz", 
                   "gt_1.3.0.tgz", "gtable_0.3.6.tgz", "highr_0.12.tgz", "htmltools_0.5.9.tgz", 
                   "htmlwidgets_1.6.4.tgz", "httpuv_1.6.17.tgz", "httr_1.4.8.tgz", 
                   "isoband_0.3.0.tgz", "jquerylib_0.1.4.tgz", "jsonlite_2.0.0.tgz", 
                   "juicyjuice_0.1.0.tgz", "knitr_1.51.tgz", "labeling_0.4.3.tgz", 
                   "later_1.4.8.tgz", "lazyeval_0.2.3.tgz", "lifecycle_1.0.5.tgz", 
                   "litedown_0.9.tgz", "magrittr_2.0.5.tgz", "markdown_2.0.tgz", 
                   "memoise_2.0.1.tgz", "mime_0.13.tgz", "mirai_2.7.2.tgz", "nanonext_1.10.2.tgz", 
                   "officer_0.7.5.tar.gz", "omopgenerics_1.4.1.tar.gz", "openssl_2.4.1.tar.gz", 
                   "otel_0.2.0.tgz", "pillar_1.11.1.tgz", "pkgconfig_2.0.3.tgz", 
                   "plotly_4.12.0.tgz", "promises_1.5.0.tgz", "purrr_1.2.2.tgz", 
                   "qs2_0.3.1.tar.gz", "R6_2.6.1.tgz", "ragg_1.5.2.tgz", "rappdirs_0.3.4.tgz", 
                   "RColorBrewer_1.1-3.tgz", "Rcpp_1.1.1-1.1.tar.gz", "RcppParallel_6.2.0.tar.gz", 
                   "reactable_0.4.5.tgz", "reactR_0.6.1.tgz", "rlang_1.2.0.tgz", 
                   "rmarkdown_2.31.tgz", "S7_0.2.2.tgz", "sass_0.4.10.tgz", "scales_1.4.0.tgz", 
                   "shiny_1.13.0.tgz", "shinyWidgets_0.9.1.tgz", "snakecase_0.11.1.tgz", 
                   "sourcetools_0.1.7-2.tgz", "stringfish_0.19.2.tar.gz", "stringi_1.8.7.tgz", 
                   "stringr_1.6.0.tgz", "sys_3.4.3.tgz", "systemfonts_1.3.2.tgz", 
                   "textshaping_1.0.5.tgz", "tibble_3.3.1.tgz", "tidyr_1.3.2.tgz", 
                   "tidyselect_1.2.1.tgz", "tinytex_0.59.tgz", "utf8_1.2.6.tgz", 
                   "uuid_1.2-2.tgz", "V8_8.2.0.tgz", "vctrs_0.7.3.tgz", "viridisLite_0.4.3.tgz", 
                   "visOmopResults_1.5.0.tgz", "withr_3.0.2.tgz", "xfun_0.57.tgz", 
                   "xml2_1.5.2.tgz", "xtable_1.8-8.tgz", "yaml_2.3.12.tgz", "zip_3.0.0.tar.gz"))
  # EXIT ------------
  unlink(
    testCellarDir,
    recursive = TRUE
  )
})

test_that("packageCellar saves multiple github packages to cellar", {
  # PREP ----------
  testLockfile <- testthat::test_path(
    "data",
    "renv.lock"
  )
  renv::lockfile_create(
    libpaths = .libPaths(),
    packages = c("DarwinShinyModules", "CohortDiagnostics", "dplyr")
  ) |> 
    renv::lockfile_write(
      file = testthat::test_path(
        "data",
        "renv.lock"
      )
    )
  checkmate::assertFileExists(testLockfile)
  testCellarDir <- file.path(
    tempdir(),
    "test_cellar"
  )
  dir.create(testCellarDir)
  # EXECUTION -------
  packageCellar(
    lockfile = testLockfile,
    cellarDir = testCellarDir,
    type = "github"
  )
  # TEST ------------
  list.files(
    testCellarDir
  ) |> 
    stringr::str_detect(
      "DarwinShinyModules"
    ) |> 
    any() |> 
    expect_true()
  # EXIT ------------
  unlink(
    testCellarDir,
    recursive = TRUE
  )
})

test_that("packageCellar saves single github package to cellar", {
  # PREP ----------
  testLockfile <- testthat::test_path(
    "data",
    "renv.lock"
  )
  renv::lockfile_create(
    libpaths = .libPaths(),
    packages = c("DarwinShinyModules", "dplyr")
  ) |> 
    renv::lockfile_write(
      file = testthat::test_path(
        "data",
        "renv.lock"
      )
    )
  checkmate::assertFileExists(testLockfile)
  testCellarDir <- file.path(
    tempdir(),
    "test_cellar"
  )
  dir.create(testCellarDir)
  # EXECUTION -------
  packageCellar(
    lockfile = testLockfile,
    cellarDir = testCellarDir,
    type = "github"
  )
  # TEST ------------
  list.files(
    testCellarDir
  ) |> 
    stringr::str_detect(
      "DarwinShinyModules"
    ) |> 
    any() |> 
    expect_true()
  # EXIT ------------
  unlink(
    testCellarDir,
    recursive = TRUE
  )
})

test_that("retrieveGithub packages to cellar", {
  testLockfile <- testthat::test_path(
     "data",
     "renv.lock"
    )
  testCellarDir <- file.path(
    tempdir(),
    "test_cellar"
  )
  dir.create(testCellarDir)
  retrieveGithub(
    lockfile = testLockfile,
    cellarDir = testCellarDir
  )
  list.files(
    testCellarDir
  ) |> 
    stringr::str_detect(
      "DarwinShinyModules"
    ) |> 
    any() |> 
    expect_true()
  unlink(
    testCellarDir,
    recursive = TRUE
  )
})

test_that("packageList git repostitories", {
  testLockfile <- testthat::test_path(
     "data",
     "renv.lock"
    )
  packageList(
    lockfile = testLockfile,
    type = "github"
  ) |> 
    expect_equal(
      list(
        DarwinShinyModules = list(
          Version = "0.7.1",
          RemoteRepo = "DarwinShinyModules", 
          RemoteUsername = "darwin-eu", RemoteHost = "api.github.com", 
          Hash = "89f480bbf075d972b4d92a5db35265f0", Requirements = c("DT", 
          "R", "R6", "checkmate", "dplyr", "flextable", "ggplot2", 
          "gt", "mirai", "plotly", "promises", "purrr", "qs2", "reactable", 
          "rlang", "shiny", "shinyWidgets", "stringr", "visOmopResults"
        )
      )
    )
  )
})

test_that("extractGithubList", {
  testLockfile <- testthat::test_path(
    "data",
    "renv.lock"
  )
  renv::lockfile_create(
    libpaths = .libPaths(),
    packages = c("DarwinShinyModules", "dplyr")
  ) |> 
    renv::lockfile_write(
      file = testthat::test_path(
        "data",
        "renv.lock"
      )
    )
  lockfile_data <- renv::lockfile_read(
    file = testLockfile
  )
  extractGithubList(lockfile_data$Packages) |> 
    expect_equal(
      list(
        DarwinShinyModules = list(
          Version = "0.7.1",
          RemoteRepo = "DarwinShinyModules", 
          RemoteUsername = "darwin-eu", RemoteHost = "api.github.com", 
          Hash = "89f480bbf075d972b4d92a5db35265f0", Requirements = c("DT", 
          "R", "R6", "checkmate", "dplyr", "flextable", "ggplot2", 
          "gt", "mirai", "plotly", "promises", "purrr", "qs2", "reactable", 
          "rlang", "shiny", "shinyWidgets", "stringr", "visOmopResults"
        )
      )
    )
  )
})

test_that("downloadGithub package to cellar", {
  testLockfile <- testthat::test_path(
    "data",
    "renv.lock"
  )
  checkmate::assertFileExists(testLockfile)
  testCellarDir <- file.path(
    tempdir(),
    "test_cellar"
  )
  dir.create(testCellarDir)
  packageList(
    lockfile = testLockfile,
    type = "github"
  ) |> 
    downloadGithub(
    cellarDir = testCellarDir
  )
  list.files(
    testCellarDir
  ) |> 
    stringr::str_detect(
      "DarwinShinyModules"
    ) |> 
    any() |> 
    expect_true()

  unlink(
    testCellarDir,
    recursive = TRUE
  )
})
