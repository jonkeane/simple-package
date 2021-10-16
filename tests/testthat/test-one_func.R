test_that("ignoring the error also works", {
    expect_equal(one_function("one"), "one")
    expect_equal(one_function("two"), "two")
})

test_that("expect the error works", {
    expect_equal(one_function("one"), "one")
    expect_error(one_function())
})
