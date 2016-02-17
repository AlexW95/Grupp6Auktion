package application;

import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

public class LeverantorLoginController implements Initializable {

	@FXML
	Button loginButton;
	@FXML
	ComboBox<Levrant�r> comboBox;
	public static String test;
	public static String test2;

	private ArrayList<Levrant�r> levLista = new ArrayList<>();

	@Override
	public void initialize(URL location, ResourceBundle resources) {

		loginButton.setOnAction(e-> {
			test = comboBox.getValue().leverans�rId;
			test2 = comboBox.getValue().namn;
			Main.stage1.close();
			Model.MODEL.main.logIn("LeverantorSidan", 730, 560);

		});
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = Model.MODEL.getConnection().prepareStatement("SELECT * FROM leverant�r");
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Levrant�r lev = new Levrant�r();
				lev.leverans�rId = rs.getString("leverant�rId");
				lev.namn = rs.getString("namn");
				lev.epost = rs.getString("epost");
				lev.provisionsniva = rs.getFloat("provisionsniv�");
				levLista.add(lev);
				comboBox.getItems().add(lev);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
