test_that("w3_alert returns a styled panel div (#2)", {
  out <- w3_alert("Beware", level = "red")
  str <- as.character(out)
  expect_true(grepl("w3-panel", str, fixed = TRUE))
  expect_true(grepl("w3-red", str, fixed = TRUE))
  expect_true(grepl("Beware", str, fixed = TRUE))
})

test_that("w3_note wraps content in a quote-styled div (#17)", {
  out <- w3_note("important")
  str <- as.character(out)
  expect_true(grepl("w3-panel", str, fixed = TRUE))
  expect_true(grepl("w3-leftbar", str, fixed = TRUE))
  expect_true(grepl("important", str, fixed = TRUE))
})

test_that("w3_quote wraps content in a styled blockquote (#20)", {
  out <- w3_quote("be yourself")
  str <- as.character(out)
  expect_true(grepl("blockquote", str, fixed = TRUE))
  expect_true(grepl("be yourself", str, fixed = TRUE))
})

test_that("w3_codespan wraps inline code (#5)", {
  out <- w3_codespan("x <- 1")
  str <- as.character(out)
  expect_true(grepl("w3-codespan", str, fixed = TRUE))
  expect_true(grepl("x &lt;- 1", str) || grepl("x <- 1", str, fixed = TRUE))
})

test_that("w3_code wraps a code block (#5)", {
  out <- w3_code("x <- 1")
  str <- as.character(out)
  expect_true(grepl("<pre", str))
  expect_true(grepl("w3-code", str, fixed = TRUE))
})

test_that("w3_tag renders as a span with w3-tag class (#26)", {
  out <- w3_tag("new")
  str <- as.character(out)
  expect_true(grepl("<span", str))
  expect_true(grepl("w3-tag", str, fixed = TRUE))
})

test_that("w3_round returns a CSS class (#21)", {
  expect_equal(w3_round(), "w3-round")
  expect_equal(w3_round("small"), "w3-round-small")
  expect_equal(w3_round("xlarge"), "w3-round-xlarge")
})

test_that("w3_round rejects unknown sizes", {
  expect_error(w3_round("jumbo"))
})

test_that("w3_margin returns a CSS class with the right direction (#15)", {
  expect_equal(w3_margin(), "w3-margin")
  expect_equal(w3_margin("top"), "w3-margin-top")
  expect_equal(w3_margin("left"), "w3-margin-left")
})

test_that("w3_icon returns a fontawesome-compatible element (#12)", {
  out <- w3_icon("home")
  str <- as.character(out)
  expect_true(grepl("<i", str))
  expect_true(grepl("fa fa-home", str, fixed = TRUE))
})

test_that("w3_progressbar renders a width-styled inner div (#19)", {
  out <- w3_progressbar(42)
  str <- as.character(out)
  expect_true(grepl("w3-light-grey", str, fixed = TRUE))
  expect_true(grepl("width:42%", str, fixed = TRUE))
})

test_that("w3_progressbar exposes ARIA attributes for screen readers (#19)", {
  str <- as.character(w3_progressbar(42))
  expect_true(grepl("role=\"progressbar\"", str, fixed = TRUE))
  expect_true(grepl("aria-valuenow=\"42\"", str, fixed = TRUE))
  expect_true(grepl("aria-valuemin=\"0\"", str, fixed = TRUE))
  expect_true(grepl("aria-valuemax=\"100\"", str, fixed = TRUE))
})

test_that("w3_alert accepts the full W3 palette (#2)", {
  # Anything w3_color() accepts must work; level is no longer restricted.
  out <- w3_alert("Heads up!", level = "teal")
  expect_true(grepl("w3-teal", as.character(out), fixed = TRUE))
  expect_error(w3_alert("nope", level = "definitely-not-a-color"))
})

test_that("w3_progressbar clamps values outside [0, 100]", {
  expect_true(grepl("width:100%", as.character(w3_progressbar(150)), fixed = TRUE))
  expect_true(grepl("width:0%",  as.character(w3_progressbar(-5)),  fixed = TRUE))
})
