clc

viewModel = SomeViewModel;
view = SomeView(viewModel);

viewModel.Greetings = "Aloha2";

cmd = viewModel.displayHelloWorld();
cmd.execute();