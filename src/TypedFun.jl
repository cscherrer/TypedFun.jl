module TypedFun

export Fun
struct Fun{A,B}
    domain :: Type{A}
    codomain :: Type{B}
    f :: Function
end

Base.convert(::Type{Function}, fun::Fun{A,B}) where {A,B} = fun.f

(fun::Fun{A,B})(x::A) where {A,B} = B(fun.f(x))

function Base.:∘(f::Fun{B,C}, g::Fun{A,B}) where {A,B,C}
    return Fun(A, C, f∘g)
end

end # module
