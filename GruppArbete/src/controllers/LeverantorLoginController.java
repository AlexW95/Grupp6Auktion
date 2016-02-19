package controllers;

import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.ResourceBundle;

import application.Main;
import application.Model;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import tables.Levrant�r;

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
		loginButton.setDisable(true);
		comboBox.setOnAction(e -> {
			loginButton.setDisable(false);
		});
		loginButton.setOnAction(e -> {
			Main.stage1.close();
			test = comboBox.getValue().getLeverans�rId();
			test2 = comboBox.getValue().getNamn();
			Main.stage1.close();
			Model.MODEL.getMain().logIn("LeverantorSidan", 620, 765);
		});
		try (Statement stm = Model.MODEL.getConnection().createStatement()) {
			ResultSet rs = stm.executeQuery("SELECT * FROM leverant�r");
			while (rs.next()) {
				Levrant�r lev = new Levrant�r();
				lev.setLeverans�rId(rs.getString("leverant�rId"));
				lev.setNamn(rs.getString("namn"));
				lev.setEpost(rs.getString("epost"));
				lev.setProvisionsniva(rs.getFloat("provisionsniv�"));
				levLista.add(lev);
				comboBox.getItems().add(lev);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

}
