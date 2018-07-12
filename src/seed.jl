const RandSeed     = 1050868099
const SplitMixSeed = 0x3ff9e3779b97f4a8

#=
    __SplitMix__ generates 64 pseudorandom bits (UInt64)
	               intended to be used initializing values
				         (internal state) for more robust RNGs
=#

splitmix_state = OneInternalState(SplitMixSeed)

function splitmix(internal::OneInternalState{T}) where {T<:IUI64}
	s1  = state(internal)
	s1 += 0x9e3779b97f4a7c15
	z   = s1
	z  ⊻= z >> 30
	z  ⊻= z >> 27
	z  ⊻= z >> 31

	state(internal, s1)
	return z
end

splitmix() = splitmix(splitmix_state)


function seed(::Type{OneInternalState{T}}, n::Int=RandSeed) where {T<:IUI32}
	srand(n)
	s1 = rand(T)
	while iszero(s1) s1 = rand(T) end
	return OneInternalState{T}(s1)
end

function seed(::Type{TwoInternalStates{T}}, n::Int=RandSeed) where {T<:IUI64}
	srand(n)
    s1, s2 = rand(T, 2)
	while iszero(&(s1,s2)) s1, s2 = rand(T, 2) end
	return TwoInternalStates{T}(s1, s2)
end

function seed(::Type{FourInternalStates{T}}, n::Int=RandSeed) where {T<:IUI64}
	srand(n)
	s1, s2, s3, s4 = rand(T, 4)
	while iszero(&(s1,s2,s3,s4)) s1,s2,s3,s4 = rand(T, 4) end
	return FourInternalStates{T}(s1, s2, s3, s4)
end

function seed(::Type{EightInternalStates{T}}, n::Int=RandSeed) where {T<:IUI64}
	srand(n)
	s1, s2, s3, s4, s5, s6, s7, s8 = rand(UInt64, 8)
	while iszero(&(s1,s2,s3,s4,s5,s6,s7,s8)) s1,s2,s3,s4,s5,s6,s7,s8 = rand(T, 8) end
	return EightInternalStates{T}(s1, s2, s3, s4, s5, s6, s7, s8)
end
