test_that("dEL works for center", {
  expect_equal(dEL(0, mu = 0, sigma = 1, delta = 1), 0.3160603, tolerance = 1e-5)
})

test_that("CDF is monotonic", {
  expect_true(pEL(0.5, 0, 1, 1) > pEL(0, 0, 1, 1))
})

test_that("qEL inverts pEL", {
  u <- 0.5
  q <- qEL(u, 0, 1, 1)
  expect_equal(pEL(q, 0, 1, 1), u, tolerance = 1e-5)
})
