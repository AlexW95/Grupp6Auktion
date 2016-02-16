package application;

import java.io.IOException;
import java.net.URL;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.scene.Parent;
import javafx.scene.Scene;

public class Main extends Application {

	URL location;
	FXMLLoader loader;
	Parent root;
	Scene scene, gameScene;
	public static Stage startStage;

	@Override
	public void start(Stage primaryStage) {
		try {
			location = this.getClass().getResource("Login.fxml");
			loader = new FXMLLoader(location);
			root = loader.load();
			scene = new Scene(root, 400, 200);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			startStage = primaryStage;
			startStage.setScene(scene);
			startStage.show();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void logIn() {
		Stage stage1 = new Stage();
		try {
			location = this.getClass().getResource("UserLogin.fxml");
			loader = new FXMLLoader(location);
			root = loader.load();
			scene = new Scene(root, 270, 150);
			stage1.setScene(scene);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			stage1.show();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void loadMaze(String mazeName) {
		try {
			location = this.getClass().getResource(mazeName + ".fxml");
			loader = new FXMLLoader(location);
			root = loader.load();
			scene = new Scene(root, 400, 400);
			startStage.setScene(scene);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		launch(args);
	}
}
