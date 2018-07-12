# rotate bits left (circular bit travel: msb --> lsb)

@inline function rotl(x::UInt8, k::Int)
	  return (x << k) | (x >> (8 - k))
end
@inline function rotl(x::UInt16, k::Int)
	  return (x << k) | (x >> (16 - k))
end
@inline function rotl(x::UInt32, k::Int)
	  return (x << k) | (x >> (32 - k))
end
@inline function rotl(x::UInt64, k::Int)
	  return (x << k) | (x >> (64 - k))
end
@inline function rotl(x::UInt128, k::Int)
	  return (x << k) | (x >> (128 - k))
end

# rotate bits right (circular bit travel: lsb --> msb)

@inline function rotr(x::UInt8, k::Int)
	  return (x << (8 - k)) | (x >> k)
end
@inline function rotr(x::UInt16, k::Int)
	  return (x << (16 - k)) | (x >> k)
end
@inline function rotr(x::UInt32, k::Int)
	  return (x << (32 - k)) | (x >> k)
end
@inline function rotr(x::UInt64, k::Int)
	  return (x << (64 - k)) | (x >> k)
end
@inline function rotr(x::UInt128, k::Int)
	  return (x << (128 - k)) | (x >> k)
end

@inline rotl(x::Int8, k::Int) = reinterpret(Int8, rotl(reinterpret(UInt8, x), k))
@inline rotl(x::Int16, k::Int) = reinterpret(Int16, rotl(reinterpret(UInt16, x), k))
@inline rotl(x::Int32, k::Int) = reinterpret(Int32, rotl(reinterpret(UInt32, x), k))
@inline rotl(x::Int64, k::Int) = reinterpret(Int64, rotl(reinterpret(UInt64, x), k))
@inline rotl(x::Int128, k::Int) = reinterpret(Int128, rotl(reinterpret(UInt128, x), k))

@inline rotl(x::Float16, k::Int) = reinterpret(Float16, rotl(reinterpret(UInt16, x), k))
@inline rotl(x::Float32, k::Int) = reinterpret(Float32, rotl(reinterpret(UInt32, x), k))
@inline rotl(x::Float64, k::Int) = reinterpret(Float64, rotl(reinterpret(UInt64, x), k))


@inline rotr(x::Int8, k::Int) = reinterpret(Int8, rotr(reinterpret(UInt8, x), k))
@inline rotr(x::Int16, k::Int) = reinterpret(Int16, rotr(reinterpret(UInt16, x), k))
@inline rotr(x::Int32, k::Int) = reinterpret(Int32, rotr(reinterpret(UInt32, x), k))
@inline rotr(x::Int64, k::Int) = reinterpret(Int64, rotr(reinterpret(UInt64, x), k))
@inline rotr(x::Int128, k::Int) = reinterpret(Int128, rotr(reinterpret(UInt128, x), k))

@inline rotr(x::Float16, k::Int) = reinterpret(Float16, rotr(reinterpret(UInt16, x), k))
@inline rotr(x::Float32, k::Int) = reinterpret(Float32, rotr(reinterpret(UInt32, x), k))
@inline rotr(x::Float64, k::Int) = reinterpret(Float64, rotr(reinterpret(UInt64, x), k))
