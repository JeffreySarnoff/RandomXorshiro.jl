module RandomXorshiro

export AbstractFastRNG, AbstractXoshroRNG,
       srand, rand, rand!, jump

import Random: AbstractRNG, srand, rand, rand!

abstract type AbstractFastRNG   <: AbstractRNG      end
abstract type AbstractXoshroRNG <: AbstractFastRNG  end

abstract type AbstractInternalState end

const IUI32 = Union{Int32, UInt32}
const IUI64 = Union{Int64, UInt64}

include("rotatebits.jl")
include("states.jl")
include("seed.jl")
include("pseudorandom.jl")
include("randvecs.jl")

end # RandomXorshiro
