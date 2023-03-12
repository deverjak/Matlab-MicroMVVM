clc

viewModel = SomeViewModel;
view = View(viewModel);

viewModel.Greetings = "Aloha2";

cmd = viewModel.displayHelloWorld();
cmd.execute();