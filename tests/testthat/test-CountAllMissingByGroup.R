test_that("Output matches direct call to dplyr", {
  small_tbl <- tibble::tribble(~group, ~var1, ~var2,
                       "A", 1, NA,
                       "A", 2, "x",
                       "B", NA, "y",
                       "C", 3, "z")

  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(across(everything(), ~sum(is.na(.x))),
                            .groups = "drop"),
                CountAllMissingByGroup(small_tbl, group)
  )

  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(across(everything(), ~sum(is.na(.x))),
                            .groups = NULL),
                CountAllMissingByGroup(small_tbl, group, NULL)
  )
})

test_that("Checking error handling for .groups input", {
  expect_error(
    CountAllMissingByGroup(airquality, Month, "kep")
  )
  expect_no_error(
    CountAllMissingByGroup(airquality, Month, NULL)
  )
})

test_that("Function can handle data frame with no missing values to count", {
  expect_no_error(
    CountAllMissingByGroup(iris, Species, NULL)
  )
  expect_no_error(
    CountAllMissingByGroup(iris, Species, "keep")
  )
})
