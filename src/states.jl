mutable struct OneInternalState{T}  <: AbstractInternalState
	s1::T
end

mutable struct TwoInternalStates{T} <: AbstractInternalState
	s1::T
	s2::T
end

mutable struct FourInternalStates{T} <: AbstractInternalState
	s1::T
	s2::T
	s3::T
	s4::T
end

mutable struct EightInternalStates{T} <: AbstractInternalState
	s1::T
	s2::T
	s3::T
	s4::T
	s5::T
	s6::T
	s7::T
	s8::T
end



state(ζ::OneInternalState{T})    where {T} = ζ.s1
state(ζ::TwoInternalStates{T})   where {T} = (ζ.s1, ζ.s2)
state(ζ::FourInternalStates{T})  where {T} = (ζ.s1, ζ.s2, ζ.s3, ζ.s4)
state(ζ::EightInternalStates{T}) where {T} = (ζ.s1, ζ.s2, ζ.s3, ζ.s4, ζ.s5, ζ.s6, ζ.s7, ζ.s8)

@inline function state(ζ::OneInternalState{T}, s1::T) where {T}
    ζ.s1 = s1
	return nothing
end

@inline function state(ζ::TwoInternalStates{T}, s1::T, s2::T) where {T}
    ζ.s1 = s1
	ζ.s2 = s2
	return nothing
end

@inline function state(ζ::FourInternalStates{T}, s1::T, s2::T, s3::T, s4::T) where {T}
	ζ.s1 = s1
	ζ.s2 = s2
	ζ.s3 = s3
	ζ.s4 = s4
	return nothing
end

@inline function state(ζ::EightInternalStates{T}, s1::T, s2::T, s3::T, s4::T, s5::T, s6::T, s7::T, s8::T) where {T}
	ζ.s1 = s1
	ζ.s2 = s2
	ζ.s3 = s3
	ζ.s4 = s4
	ζ.s5 = s5
	ζ.s6 = s6
	ζ.s7 = s7
	ζ.s8 = s8
	return nothing
end

OneInternalState(::Type{T}) = OneInternalState(rand(T))
TwoInternalStates(::Type{T}) = TwoInternalStates(rand(T,2)...,)
FourInternalStates(::Type{T}) = FourInternalStates(rand(T,4)...,)
EightInternalStates(::Type{T}) = EightInternalStates(rand(T,8)...,)
