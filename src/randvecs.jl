function rand(internal::OneInternalState{T}, n::Int)::Vector{T} where {T<:IUI32}
	result = Vector{T}(undef, n)
	for idx=1:n
		result[idx] = rand(internal)
	end
	return result
end

function rand(internal::TwoInternalStates{T}, n::Int)::Vector{T} where {T<:IUI64}
	result = Vector{T}(undef, n)
	for idx=1:n
		result[idx] = rand(internal)
	end
	return result
end

function rand(internal::FourInternalStates{T}, n::Int)::Vector{T} where {T<:IUI64}
	result = Vector{T}(undef, n)
	for idx=1:n
		result[idx] = rand(internal)
	end
	return result
end

function rand(internal::EightInternalStates{T}, n::Int)::Vector{T} where {T<:IUI64}
	result = Vector{T}(undef, n)
	for idx=1:n
		result[idx] = rand(internal)
	end
	return result
end
