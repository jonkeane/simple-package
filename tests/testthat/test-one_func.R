with_mock_db(
    test_that("get_an_airline can get one airline", {
        one_airline <- get_an_airline()
        expect_is(one_airline, "data.frame")
        expect_equal(nrow(one_airline), 1)
        expect_equal(one_airline$carrier, "UA")
        expect_equal(one_airline$name, "United Air Lines Inc.")
    })
)

# cp nycflights to a new folder under db_issues

with_mock_path(test_path("db_issues"),{
    with_mock_db(
        test_that("get_an_airline can get one airline errors correctly", {
            expect_error(get_an_airline(), "This is the test airline")
        })
    )
})