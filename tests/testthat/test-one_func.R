
with_mock_db({
    test_that("get_an_airline works", {
        one_airline <- get_an_airline()
        expect_s3_class(one_airline, "data.frame")
        expect_equal(nrow(one_airline), 1)
        expect_equal(one_airline$carrier, "HA")
    })
})

with_mock_path(test_path("db_issues"), {
    with_mock_db({
        test_that("get_an_airline errors on tests", {
            expect_error(get_an_airline())
        })
    })
})
