function rand(internal::TwoInternalStates{T})::T where {T<:IUI32}
    s1, s2 = state(internal)

	nextvalue = s1 * 0x9E3779BB
	nextvalue = rotl(nextvalue, 5)
	nextvalue += nextvalue << 2

	s2 = s2 ⊻ s1
	s1 = rotl(s1, 26)
	s1 = s1 ⊻ (s2 ⊻ (s2 << 9))
	s2 = rotl(s2, 13)

	state(internal, s1, s2)

	return nextvalue
end


function rand(internal::TwoInternalStates{T}) where {T<:IUI64}
    s1, s2 = state(internal)

	nextvalue =  s1
	nextvalue += s1 << 2
	nextvalue =  rotl(nextvalue, 7)
	nextvalue += nextvalue << 3

	s2 ⊻= s1
	s1 = rotl(s1, 24)
	s1 ⊻= s2 ⊻ (s2 << 16)
	s2 = rotl(s2, 37)

	state(internal, s1, s2)

	return nextvalue
end

function rand(internal::FourInternalStates{T}) where {T<:IUI64}
    s1, s2, s3, s4 = state(internal)

	nextvalue =  s2
	nextvalue += s2 << 2
	nextvalue =  rotl(nextvalue, 7)
	nextvalue += nextvalue << 3

	t = s2 << 17

	s3 ⊻= s1
	s4 ⊻= s2
	s2 ⊻= s3
	s1 ⊻= s4

	s3 ⊻= t
	s4 = rotl(s4, 45)

	state(internal, s1, s2, s3, s4)

	return nextvalue
end


function rand(internal::EightInternalStates{T}) where {T<:IUI64}
	s1, s2, s3, s4, s5, s6, s7, s8 = state(internal)

	nextvalue =  s2
	nextvalue += s2 << 2
	nextvalue =  rotl(nextvalue, 7)
	nextvalue += nextvalue << 3

	t = s2 << 11

	s3 ⊻= s1
	s6 ⊻= s2
	s2 ⊻= s3
	s8 ⊻= s4
	s4 ⊻= s5
	s5 ⊻= s6
	s1 ⊻= s7
	s7 ⊻= s8

	s7 ⊻= t
	s8 = rotl(s8, 45)

	state(internal, s1, s2, s3, s4, s5, s6, s7, s8)

	return nextvalue
end
