clc

viewModel = SomeViewModel;
view = SomeView(viewModel);

viewModel.Greetings = "Hello World";

cmd = viewModel.greet();
cmd.execute();