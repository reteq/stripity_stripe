defmodule Stripe.Balance do
  @moduledoc """
  Work with Stripe balance

  You can:

  - Retrieve retrive stripe account balance

  Stripe API reference: https://stripe.com/docs/api#balance
  """

  @type t :: %__MODULE__{}

  defstruct [
    :id, :object,
    :available, :connect_reserved, :livemode,
    :pending
  ]

  @plural_endpoint "balance"

  @doc """
  Retrieve account balance
  """
  @spec retrieve(binary) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def retrieve(account_id) do
    endpoint = @plural_endpoint
    Stripe.Request.retrieve(endpoint, [connect_account: account_id])
  end
end
