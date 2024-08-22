test_that("select2() works with variables names", {
  for (vars in list(c("Sepal.Length", "Species"),
                    "Species",
                    character(0),
                    names(iris))) {
    df1 <- select2(iris, vars)
    expect_s3_class(df1, "data.frame")
    expect_equal(dim(df1), c(nrow(iris), length(vars)))
    expect_equal(df1, dplyr::select(iris, dplyr::all_of(vars)))
  }
})

