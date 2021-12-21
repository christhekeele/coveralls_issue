# CoverallsIssue

Repo issue in https://github.com/parroty/excoveralls/issues/273

Works fine with current steps.

## Steps Ran

- 
  ```sh
  $ elixir --version
  Erlang/OTP 24 [erts-12.0] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit]

  Elixir 1.12.0 (compiled with Erlang/OTP 24)
  ```

- 
  ```sh
  $ mix new coveralls_issue
  $ cd coveralls_issue
  ```

- add `[tool: ExCoveralls]` to `mix.exs` `:test_coverage`
- add `{:excoveralls, "~> 0.14", only: [:dev, :test]}` to `mix.exs` `:deps`

-
  ```sh
  $ cat mix.exs
  defmodule CoverallsIssue.MixProject do
    use Mix.Project

    def project do
      [
        app: :coveralls_issue,
        version: "0.1.0",
        elixir: "~> 1.12",
        start_permanent: Mix.env() == :prod,
        deps: deps(),
        test_coverage: [tool: ExCoveralls]
      ]
    end

    # Run "mix help compile.app" to learn about applications.
    def application do
      [
        extra_applications: [:logger]
      ]
    end

    # Run "mix help deps" to learn about dependencies.
    defp deps do
      [
        # {:dep_from_hexpm, "~> 0.3.0"},
        # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
        {:excoveralls, "~> 0.14", only: [:dev, :test]}
      ]
    end
  end
  ```

-
  ```sh
  $ mix deps.get
  Resolving Hex dependencies...
  Dependency resolution completed:
  New:
    certifi 2.8.0
    excoveralls 0.14.4
    hackney 1.18.0
    idna 6.1.1
    jason 1.3.0
    metrics 1.0.1
    mimerl 1.2.0
    parse_trans 3.3.1
    ssl_verify_fun 1.1.6
    unicode_util_compat 0.7.0
  * Getting excoveralls (Hex package)
  * Getting hackney (Hex package)
  * Getting jason (Hex package)
  * Getting certifi (Hex package)
  * Getting idna (Hex package)
  * Getting metrics (Hex package)
  * Getting mimerl (Hex package)
  * Getting parse_trans (Hex package)
  * Getting ssl_verify_fun (Hex package)
  * Getting unicode_util_compat (Hex package)
  ```

-
  ```
  $ mix deps.compile
  ===> Analyzing applications...
  ===> Compiling parse_trans
  ===> Analyzing applications...
  ===> Compiling mimerl
  ===> Analyzing applications...
  ===> Compiling metrics
  ===> Analyzing applications...
  ===> Compiling unicode_util_compat
  ===> Analyzing applications...
  ===> Compiling idna
  ==> jason
  Compiling 10 files (.ex)
  Generated jason app
  ==> ssl_verify_fun
  Compiling 7 files (.erl)
  Generated ssl_verify_fun app
  ===> Analyzing applications...
  ===> Compiling certifi
  ===> Analyzing applications...
  ===> Compiling hackney
  ==> excoveralls
  Compiling 28 files (.ex)
  Generated excoveralls app
  ==> coveralls_issue
  Compiling 1 file (.ex)
  Generated coveralls_issue app
  ```

- 
  ```sh
  $ MIX_ENV=test mix coveralls.html
  ..

  Finished in 0.02 seconds (0.00s async, 0.02s sync)
  1 doctest, 1 test, 0 failures

  Randomized with seed 206079
  ----------------
  COV    FILE                                        LINES RELEVANT   MISSED
    0.0% lib/coveralls_issue.ex                         18        0        0
  [TOTAL]   0.0%
  ----------------
  Generating report...
  Saved to: cover/
  ```