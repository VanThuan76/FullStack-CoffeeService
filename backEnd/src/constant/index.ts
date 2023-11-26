export class Constant {
    static generateRandomString(length: number): string {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';

        while (result.length < length) {
            const randomIndex = Math.floor(Math.random() * characters.length);
            const character = characters.charAt(randomIndex);

            if (/[a-zA-Z0-9]/.test(character)) {
                result += character;
            }
        }

        return result;
    }
}
