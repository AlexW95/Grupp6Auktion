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
	public static Stage startStage, stage1, stage2;
	private ProcessaEpost processaEpost;

	@Override
	public void start(Stage primaryStage) {
		try {
			processaEpost = new ProcessaEpost();
			processaEpost.startTask();
			location = this.getClass().getResource("StartSida.fxml");
			loader = new FXMLLoader(location);
			root = loader.load();
			scene = new Scene(root, 430, 230);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			startStage = primaryStage;
			startStage.setScene(scene);
			startStage.show();
			startStage.setOnCloseRequest(e -> {
				processaEpost.cancel();
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void logIn(String pathName, int height, int width) {
		stage1 = new Stage();
		try {
			location = this.getClass().getResource(pathName + ".fxml");
			loader = new FXMLLoader(location);
			root = loader.load();
			scene = new Scene(root, height, width);
			stage1.setScene(scene);
			stage1.setMaxHeight(height);
			stage1.setMaxWidth(width);
			stage1.setMinHeight(height);
			stage1.setMinWidth(width);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			stage1.show();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		launch(args);
	}
}
