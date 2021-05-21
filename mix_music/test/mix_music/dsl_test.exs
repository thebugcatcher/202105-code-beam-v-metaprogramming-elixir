defmodule MixMusic.DSLTester do
  use MixMusic.DSL

  sequence :do_re_mi do
    note(:c, octet: 4, volume: 50, duration: 0.25)
    note(:d, modifier: :base, duration: 0.25)
    note(:e, modifier: :base, duration: 0.25)
  end

  sequence :fa_so_la_ti_do do
    note(:f, octet: 4, volume: 50, duration: 0.25)
    note(:g, modifier: :base, duration: 0.25)
    note(:a, duration: 0.25)
    note(:b, duration: 0.25)
    note(:c, octet: 5, duration: 0.25)
  end

  sequence :song do
    embed_notes(:do_re_mi)
    embed_notes(:fa_so_la_ti_do)
  end
end

defmodule MixMusic.DSLTest do
  use ExUnit.Case
  import ExUnit.CaptureLog

  alias MixMusic.{DSL, DSLTester}

  describe "play_sequence/2" do
    test "raises when calling a sequence that's not defined" do
      assert_raise(RuntimeError, ~r/sequence bad_sequence not defined/, fn ->
        DSLTester.play(:bad_sequence)
      end)
    end

    test "plays a sequence when it's defined" do
      output = capture_log(fn -> DSLTester.play(:do_re_mi) end)

      assert output =~ "Played Note: c base 4"
      assert output =~ "Played Note: d base 4"
      assert output =~ "Played Note: e base 4"
    end
  end

  describe "__before_compile__/1" do
    require DSL

    test "defines a function `__sequences__` which delegates to `@sequences`" do
      expected =
        quote do
          def __sequences__, do: @sequences
        end

      expr = quote do: DSL.__before_compile__(nil)
      expanded = Macro.expand_once(expr, __ENV__)

      assert Macro.to_string(expected) == Macro.to_string(expanded)
    end

    test "defines `DSLTester.__sequences__/0`" do
      sequences = Keyword.keys(DSLTester.__sequences__())

      assert :song in sequences
      assert :do_re_mi in sequences
      assert :fa_so_la_ti_do in sequences
    end
  end

  describe "sequence/2" do
    test "updates `@sequences`" do
      quoted_module =
        quote location: :keep do
          defmodule QuotedModule.Sequence do
            import DSL

            Module.register_attribute(__MODULE__, :sequences, accumulate: true)

            def sequences_before, do: @sequences

            sequence :test do
              @current_sequence 5
              @current_sequence 10
            end

            def sequences_after, do: @sequences
          end
        end

      Code.eval_quoted(quoted_module)

      assert QuotedModule.Sequence.sequences_before() == []
      assert QuotedModule.Sequence.sequences_after() == [test: [5, 10]]
    end
  end

  describe "note/2" do
    test "can only be called inside a sequence" do
      quoted_module =
        quote location: :keep do
          defmodule QuotedModule.Note do
            import DSL

            note(:c, volume: 10)
          end
        end

      assert_raise(RuntimeError, "note can only be called inside a sequence", fn ->
        Code.eval_quoted(quoted_module)
      end)
    end
  end

  describe "embed_notes/2" do
    test "can only be called inside a sequence" do
      quoted_module =
        quote location: :keep do
          defmodule QuotedModule.Note do
            import DSL

            embed_notes(:sequence)
          end
        end

      assert_raise(RuntimeError, "embed_notes can only be called inside a sequence", fn ->
        Code.eval_quoted(quoted_module)
      end)
    end
  end
end
