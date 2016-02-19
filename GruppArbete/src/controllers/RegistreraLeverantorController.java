package controllers;

import java.net.URL;
import java.sql.PreparedStatement;
import java.util.ResourceBundle;

import application.Main;
import application.Model;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class RegistreraLeverantorController implements Initializable {

	@FXML
	TextField namnField, epostField, nummerField, adressField, postnummerField, ortField;
	@FXML
	Button button, closeButton;

	@Override
	public void initialize(URL location, ResourceBundle resources) {

		button.setDisable(true);
		ortField.setOnMouseClicked(e -> {
			button.setDisable(false);
		});
		button.setOnAction(e -> {
			try {
				PreparedStatement pS = Model.MODEL.getConnection().prepareStatement(
						"INSERT INTO leverant�r (Namn, Epost, Telefon, gatuadress ,postnummer , ort ,provisionsniv�) VALUES (?, ? ,?, ?, ? , ? , ?)");
				pS.setString(1, namnField.getText());
				pS.setString(2, epostField.getText());
				pS.setString(3, nummerField.getText());
				pS.setString(4, adressField.getText());
				pS.setString(5, postnummerField.getText());
				pS.setString(6, ortField.getText());
				pS.setFloat(7, (float) 0.10);
				pS.executeUpdate();
				System.out.println("leverant�r inlagd");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			namnField.clear();
			epostField.clear();
			nummerField.clear();
			adressField.clear();
			postnummerField.clear();
			ortField.clear();
			Main.stage1.close();

		});

	}

}
