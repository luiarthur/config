# This file belongs in: ~/.julia/config/startup.jl

# NOTE: For julia >= 1.4.1 
atreplinit() do repl
  try
    println("Loading Revise.jl at the REPL. Expect a brief delay ... ")
    @eval using Revise
  catch e
    println("Could not load Revise.jl.")
    @warn(e.msg)
  end
end

# NOTE: for julia <= 1.3.1
# atreplinit() do repl
#     try
#         @eval using Pkg
#         haskey(Pkg.installed(), "Revise") || @eval Pkg.add("Revise")
#     catch
#     end
#     try
#         println("Loading Revise.jl at the REPL. Expect a brief delay ... ")
#         @eval using Revise
#         @async Revise.wait_steal_repl_backend()
#     catch
#     end
# end
