test_that("get an airline", {
    one_airline <- get_an_airline()
    expect_s3_class(one_airline, "data.frame")
    expect_equal(nrow(one_airline), 1)
})