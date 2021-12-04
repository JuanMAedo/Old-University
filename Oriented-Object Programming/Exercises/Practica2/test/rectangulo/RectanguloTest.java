/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rectangulo;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import practica2.Rectangulo;

/**
 *
 * @author juanm
 */
public class RectanguloTest {
    
    Rectangulo rect1, rect2;
    public RectanguloTest() {
        rect1 = new Rectangulo();
        rect2 = new Rectangulo(2,5);
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    @Test
    public void testBase1() {
    assertEquals("(0,0) y (1,1)", 1, rect1.base() );
    }
    
    @Test
    public void testBase2() {   
    assertEquals("(0,0) y (2,5)", 2, rect2.base());
    }
    @Test
    public void testAltura1() {
    assertEquals("(0,0) y (1,1)", 1, rect1.altura());
    }
    
    @Test
    public void testAltura2 () {
    assertEquals("(0,0) y (2,5)", 5, rect2.altura());
    }
    
    @Test
    public void testArea1 (){
    assertEquals("(0,0) y (1,1)", 1, rect1.area());
    }
    
    @Test
    public void testArea2 (){
    assertEquals("(0,0) y (2,5)", 10, rect2.area());
    }
    
     @Test
    public void testPerimetro1 (){
    assertEquals("(0,0) y (1,1)", 4, rect1.perimetro());
    }

     @Test
    public void testPerimetro2 (){
    assertEquals("(0,0) y (2,5)", 14, rect2.perimetro());
    }


}

