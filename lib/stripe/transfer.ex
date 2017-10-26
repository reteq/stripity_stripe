defmodule Stripe.Transfer do
  @moduledoc """
  Work with Stripe transfer objects.

  You can:

  - Create a transfer
  - Retrieve a transfer

  Stripe API reference: https://stripe.com/docs/api#transfer
  """

  @type t :: %__MODULE__{}

  defstruct [
    :id, :object,
    :amount, :amount_reversed, :balance_transaction, :created,
    :currency, :description, :destination, :destination_payment, :livemode,
    :metadata, :reversals, :reversed, :source_transaction, :source_type,
    :transfer_group
  ]

  @plural_endpoint "transfers"

  @schema %{
    amount: [:create, :retrieve],
    currency: [:create],
    destination: [:create],
    metadata: [:create],
    source_transaction: [:create],
    transfer_group: [:create]
  }

  @doc """
  Create a transfer.
  """
  @spec create(map, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def create(changes, opts \\ []) do
    Stripe.Request.create(@plural_endpoint, changes, @schema, opts)
  end

  @doc """
  Retrieve a transfer.
  """
  @spec retrieve(binary, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def retrieve(id, opts \\ []) do
    endpoint = @plural_endpoint <> "/" <> id
    Stripe.Request.retrieve(endpoint, opts)
  end

  @doc """
  List all transfers.
  """
  @spec list(map, Keyword.t) :: {:ok, Stripe.List.t} | {:error, Stripe.api_error_struct}
  def list(params \\ %{}, opts \\ []) do
    endpoint = @plural_endpoint
    Stripe.Request.retrieve(params, endpoint, opts)
  end
end
