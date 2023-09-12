defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add( {n1, d1}, {n2, d2}) do
    reduce({n1*d2 + n2*d1, d1*d2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1,a2}, {b1, b2}) do
    add({a1,a2}, {-b1, b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1,a2}, {b1,b2}) do
    {a1*b1, a2*b2} |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({n1,n2}, {d1,d2}) do
    multiply({n1,n2}, {d2,d1})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({n,d}) do
    {Kernel.abs(n), Kernel.abs(d)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, den}, n) when n < 0 do
    {den**(-n), num**(-n)} |> reduce()
  end

  def pow_rational({num,den}, n) do
    {num**n, den**n} |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({n, d}) do
    g = gcd(Kernel.abs(n), Kernel.abs(d))
    {div(n,g), div(d,g)} |> fix_sign()
  end

  # defp fix_sign({n,d}) when n < 0 and d < 0, do: {-n, -d}
  defp fix_sign({n,d}) when d < 0, do: {-n, -d}
  defp fix_sign({n,d}), do: {n,d}


  defp gcd(a,a), do: a

  defp gcd(a, 0), do: a

  defp gcd(a,b) when a < b, do: gcd(b,a)

  defp gcd(a, b) when a > b, do: gcd(a-b, b)
end
