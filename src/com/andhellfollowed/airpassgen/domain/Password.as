/**
 *
 * @author Juerg Gutknecht
 *
 * This file is part of AirPassGen.
 *
 * AirPassGen is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * AirPassGen is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with AirPassGen. If not, see <http://www.gnu.org/licenses/>.
 */

package com.andhellfollowed.airpassgen.domain
{
	public class Password
	{
		
		protected const UPPERCASE_LETTERS:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		protected const LOWERCASE_LETTERS:String = "abcdefghijklmnopqrstuvwxyz";
		protected const NUMBERS:String			 = "0123456789";
		protected const SYMBOLS:String			 = "!@#$^&*()-=~";
		
		protected var length:uint;
		protected var hasUppercaseLetters:Boolean;
		protected var hasLowercaseLetters:Boolean;
		protected var hasNumbers:Boolean;
		protected var hasSymbols:Boolean;
		protected var password:String;
		protected var characters:String;
		
		public function Password(length:uint,uppercaseLetters:Boolean,lowercaseLetters:Boolean,numbers:Boolean,symbols:Boolean) {
			this.length = length;
			this.hasUppercaseLetters = uppercaseLetters;
			this.hasLowercaseLetters = lowercaseLetters;
			this.hasNumbers = numbers;
			this.hasSymbols = symbols;
			this.characters = this.createCharacterString();
		}
		
		public function createPassword():String {
			var password:String = "";
			
			for(var i:uint=0;i<this.length;i++) {
				var pos:uint = Math.ceil(Math.random()*this.characters.length-1);
				password += this.characters.charAt(pos);
			}
			
			this.password = password;
			return password;
		}
		
		protected function createCharacterString():String {
			var characters:String = "";
			
			if(true == this.hasUppercaseLetters) {
				characters += UPPERCASE_LETTERS;
			}
			
			if(true == this.hasLowercaseLetters) {
				characters += LOWERCASE_LETTERS;
			}
			
			if(true == this.hasNumbers) {
				characters += NUMBERS;
			}
			
			if(true == this.hasSymbols) {
				characters += SYMBOLS;
			}
			
			return characters;
		}

		public function getPassword():String {
			return this.password;
		}
		
		public function getCharacters():String {
			return this.characters;
		}
	}
}