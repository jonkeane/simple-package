with_mock_db({
    test_that("get_an_airline works", {
        one_airline <- get_an_airline()
        expect_s3_class(one_airline, "data.frame")
        expect_equal(nrow(one_airline), 1)
        expect_equal(one_airline$carrier, "FL")
        expect_equal(one_airline$name, "AirTran Airways Corporation")
    })
})


with_mock_path(test_path("db_issues"), {
    with_mock_db({
        expect_error(get_an_airline())
    })
})