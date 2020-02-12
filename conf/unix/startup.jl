# This file belongs in: ~/.julia/config/startup.jl

atreplinit() do repl
    try
        @eval using Pkg
        haskey(Pkg.installed(), "Revise") || @eval Pkg.add("Revise")
    catch
    end
    try
        println("Loading Revise.jl at the REPL. Expect a brief delay ... ")
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
    end
end
