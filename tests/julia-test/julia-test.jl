using Statistics

function singlecore_test(; reps, m=Int(1e6))
  [@elapsed sum(randn(m) .^ 2) for i in 1:reps]
end

function multicore_test(; reps, m=500)
  x = randn(m, m)
  [@elapsed sum(inv(x'x)) for i in 1:reps]
end

function benchmarkmsg(name, times; digits=3, nsd=1.96)
  n = length(times)
  est = round(mean(times), digits=digits)
  err_margin = nsd * std(times) / sqrt(n)
  lower = round(est - err_margin, digits=digits)
  upper = round(est + err_margin, digits=digits)
  "$(name): $(est) ($(lower), $(upper))"
end

# Single-core test
_ = singlecore_test(reps=2);
singlecore_times = singlecore_test(reps=100)
println(benchmarkmsg("Single-core speed", singlecore_times, digits=5))


# Multi-core test
_ = multicore_test(reps=2)
mc_times = multicore_test(reps=100)
println(benchmarkmsg("Multi-core speed", mc_times, digits=5))

