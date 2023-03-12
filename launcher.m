clc

viewModel = SomeViewModel;
view = View(viewModel);

viewModel.setGreetings("Aloha");

cmd = viewModel.displayHelloWorld();
cmd.execute();