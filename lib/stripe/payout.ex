defmodule Stripe.Payout do
  @moduledoc """
  Work with Stripe payout

  You can:

  - Retrieve a payout
  - List payouts
  - Create a payout

  Stripe API reference: https://stripe.com/docs/api#balance
  """

  @type t :: %__MODULE__{}

  defstruct [
    :id, :object,
    :amount, :arrival_date, :balance_transaction,
    :created, :currency, :description, :destination,
    :failure_message, :failure_code, :method, :source_type,
    :status, :metadata
  ]

  @schema %{
    amount: [:retrieve, :create],
    currency: [:retrieve, :create],
    destination: [:retrieve, :create],
    metadata: [:retrieve, :create],
    method: [:retrieve, :create]
  }

  @plural_endpoint "payouts"

  @doc """
  Create a payout.
  """
  @spec create(map, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def create(changes, opts \\ []) do
    Stripe.Request.create(@plural_endpoint, changes, @schema, opts)
  end

  @doc """
  Retrieve a payout.
  """
  @spec retrieve(binary, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def retrieve(id, opts \\ []) do
    endpoint = @plural_endpoint <> "/" <> id
    Stripe.Request.retrieve(endpoint, opts)
  end

  @doc """
  List all plans.
  """
  @spec list(map, Keyword.t) :: {:ok, Stripe.List.t} | {:error, Stripe.api_error_struct}
  def list(params \\ %{}, opts \\ []) do
    endpoint = @plural_endpoint
    Stripe.Request.retrieve(params, endpoint, opts)
  end
end
